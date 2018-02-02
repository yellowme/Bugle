//
//  BugleType.swift
//  Bugle
//
//  Created by Luis Burgos on 2/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

public enum BugleType {
    case single
    case confirmation
    case risky
    
    func style(for preferredOptions: BugleOptions?) -> BugleActionStyles? {
        guard let preferredOptions = preferredOptions else { return nil }
        
        switch self {
        case .risky:
            return (.cancel, .default, preferredOptions.errorTintColor)
        default:
            return (.default, .cancel, preferredOptions.tintColor)
        }
    }
}
