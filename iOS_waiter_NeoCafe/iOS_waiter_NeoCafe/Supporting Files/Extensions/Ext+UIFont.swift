//
//  Ext+UIFont.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 18/03/24.
//

import UIKit

extension UIFont {
    static func poppins(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        var font: UIFont
        
        switch weight {
        case .bold:
            font = UIFont(name: "Poppins-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        case .semibold:
            font = UIFont(name: "Poppins-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
        case .medium:
            font = UIFont(name: "Poppins-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
        default:
            font = UIFont(name: "Poppins-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        return font
    }
}

/// Use case:
//UIFont.poppins(ofSize: 16, weight: .bold)

