//
//  Bugle.swift
//  Yellowme
//
//  Created by Luis Burgos on 1/3/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

typealias BugleActionStyles = (confirm: UIAlertActionStyle, cancel: UIAlertActionStyle, color: UIColor?)

@objc public protocol BugleDelegate {
    func didConfirm()
    @objc optional func didCancel()
}

public class Bugle {
    public static let shared = Bugle()
    private static var preferredOptions: BugleOptions?
    
    public class func setup(with options: BugleOptions) {
        Bugle.preferredOptions = options
    }
    
    private init() { }
    
    public func play(
        _ message: String,
        _ title: String? = nil,
        _ actionTitle: String? = nil,
        _ decorated: Bool = true,
        _ delegate: BugleDelegate? = nil,
        on controller: UIViewController,
        type: BugleType = .single){
        
        guard
            let preferredOptions = Bugle.preferredOptions,
            let style = type.style(for: preferredOptions) else {
                fatalError("Error - you must call setup before accessing this method")
        }
        
        let alert = prepare(with: title ?? preferredOptions.commonTitle, message)
        let actionTitle = actionTitle ?? preferredOptions.commonAction
        
        switch type {
        case .risky:
            fallthrough
        case .confirmation:
            alert.addAction(UIAlertAction(title: actionTitle, style: style.confirm, handler: { (action: UIAlertAction!) in
                delegate?.didConfirm()
            }))
            alert.addAction(UIAlertAction(title: preferredOptions.cancelMessage, style: style.cancel, handler: { (action: UIAlertAction!) in
                delegate?.didCancel?()
            }))
            break
        default:
            alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default) { action in
                delegate?.didConfirm()
            })
        }
        
        if decorated {
            presentDecorated(alert, on: controller, tintColor: style.color)
        } else {
            controller.present(alert, animated: true, completion: nil)
        }
    }
}


