//
//  UIViewController+Bridge.swift
//  Bugle
//
//  Created by Luis Burgos on 3/31/19.
//  Copyright © 2019 Yellowme. All rights reserved.
//

import UIKit

extension String {
    // NOTE: Maybe you could use localization approaches here.
    static let defaultAlertTitle = "Bugle"
    static let defaultAlertActionLabel = "Understood"
    
    static let customTitle = "Are you sure?"
    static let customMessage = "This action cannot be undo"
    static let customCancel =  "No, forget it"
    static let customAction =  "Yes, I'm a savage"
}

// MARK: - Initializers
extension UIAlertController {
    /// Create new alert view controller.
    ///
    /// - Parameters:
    ///   - message: alert controller's message (default is nil).
    ///   - tintColor: alert controller's tint color (default is nil)
    convenience init(message: String? = nil, tintColor: UIColor? = nil) {
        self.init(
            title: String.defaultAlertTitle,
            message: message,
            preferredStyle: .alert
        )
    }
}

extension UIAlertController {
    /// Displays an alert view by adding the default action in order to be able to dismiss it.
    func play() {
        self.addAction(UIAlertAction(title: String.defaultAlertActionLabel, style: .default, handler: nil))
        self.show()
    }
    
    static func playRiskyCustomAlert(_ confirmation: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(style: .alert, title: String.customTitle, message: String.customMessage)
        alert.addAction(title: String.customCancel, style: .default)
        alert.addAction(UIAlertAction(title: String.customAction, style: .destructive, handler: confirmation))
        alert.show()
    }
}
