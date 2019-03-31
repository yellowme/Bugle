//
//  Utils.swift
//  Bugle
//
//  Created by Luis Burgos on 1/17/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

// Example color utils
extension UIColor {
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        
        return UIColor(
            red: min(red + percentage/100, 1.0),
            green: min(green + percentage/100, 1.0),
            blue: min(blue + percentage/100, 1.0),
            alpha: alpha
        )
    }
}

