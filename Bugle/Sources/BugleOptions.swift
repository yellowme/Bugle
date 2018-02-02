//
//  BugleOptions.swift
//  Bugle
//
//  Created by Luis Burgos on 2/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

public struct BugleOptions {
    public let tintColor: UIColor?
    public let errorTintColor: UIColor?
    public let cancelMessage: String
    public let commonTitle: String
    public let commonAction: String
    
    public init(tintColor: UIColor?, cancelMessage: String, commonTitle: String, commonAction: String, errorTintColor: UIColor?) {
        self.tintColor = tintColor
        self.cancelMessage = cancelMessage
        self.commonTitle = commonTitle
        self.commonAction = commonAction
        self.errorTintColor = errorTintColor
    }
}
