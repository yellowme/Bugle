//
//  AppDelegate.swift
//  Bugle
//
//  Created by Luis Burgos on 1/17/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Bugle.setup(with: options)
        return true
    }
}

extension AppDelegate {
    fileprivate var options: BugleOptions {
        return BugleOptions(
            tintColor: .green,
            cancelMessage: "No, forget it",
            commonTitle: "Bugle news!",
            commonAction: "Understood",
            errorTintColor: UIColor.yellow.darker(by: 30)
        )
    }
}

