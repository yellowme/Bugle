//
//  Bugle.swift
//  Yellowme
//
//  Created by Luis Burgos on 1/3/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

/**
 Implement this on your UIViewController in order to listen to user actions.
 */
@objc public protocol BugleDelegate {
    func didConfirm()
    @objc optional func didCancel()
}

/**
 Helper for displaying alerts without writing boilerplate code.
 */
public class Bugle {
    /**
     Public API access
     */
    public static let shared = Bugle()
    
    /**
     Set of user defined options after calling "setup" method.
     */
    private static var preferredOptions: [BuglePiece: Any]?

    /**
     Establish preferred user options when calling "play" method.
     If this method is not called before trying to display an alert the
     application would crash.
     */
    public class func setup(with options: [BuglePiece: Any]) {
        Bugle.preferredOptions = options
    }
    
    /**
     Helper init
     */
    private init() { }
    
    /**
     
     */
    public func play(
        _ message: String,
        _ options: [BuglePiece: Any]? = nil,
        _ decorated: Bool = true,
        on controller: UIViewController,
        ofType type: BugleType = .single) {
        
        guard let preferredOptions = options ?? Bugle.preferredOptions else {
            fatalError("Error - you must call setup before accessing this method")
        }
        
        guard let style = type.style(for: preferredOptions) else {
            fatalError("Error - you must provide tint and errorTint values")
        }
        
        guard let title = (options?[.title] as? String) ?? (Bugle.preferredOptions?[.title] as? String) else {
            fatalError("Error - you must provide a common alert title")
        }
        
        let alert = prepare(with: title, message)
        
        guard let actionTitle = (options?[.action] as? String) ?? (Bugle.preferredOptions?[.action] as? String) else {
            fatalError("Error - you must provide a common action title")
        }
        
        let delegate: BugleDelegate? = (controller as? BugleDelegate)
        
        switch type {
        case .risky:
            fallthrough
        case .confirmation:
            alert.addAction(UIAlertAction(title: actionTitle, style: style.confirm, handler: { (action: UIAlertAction!) in
                delegate?.didConfirm()
            }))
            
            guard let cancelMessage = preferredOptions[.cancel] as? String else {
                fatalError("Error - you must provide a cancel action label")
            }
            
            alert.addAction(UIAlertAction(title: cancelMessage, style: style.cancel, handler: { (action: UIAlertAction!) in
                delegate?.didCancel?()
            }))
            break
        default:
            alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default) { action in
                delegate?.didConfirm()
            })
        }
        
        if decorated, let color = style.color {
            presentDecorated(alert, on: controller, tintColor: color)
        } else {
            controller.present(alert, animated: true, completion: nil)
        }
    }
}


