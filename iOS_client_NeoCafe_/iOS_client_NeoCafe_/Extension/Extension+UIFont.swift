//
//  Extension+UIFont.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/2/24.
//

import UIKit

enum CustomFontWeight: String {
    case regular
    case medium
    case bold

    func fontName() -> String {
        switch self {
        case .regular:
            return FontFamily.Poppins.regular.name
        case .medium:
            return FontFamily.Poppins.medium.name
        case .bold:
            return FontFamily.Poppins.bold.name
        }
    }
}

extension UIFont {
    static func poppins(size: Int, weight fontWight: CustomFontWeight) -> UIFont {
        return UIFont(name: fontWight.fontName(), size: CGFloat(size)) ?? UIFont.systemFont(ofSize: CGFloat(size))
    }
}
