//
//  Ext+UIFont.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 18/03/24.
//

// MARK: - UIFont Extension

/// This extension enhances UIFont by providing a convenient way to create Poppins font instances with specified size and weight.
/// Poppins is a typeface that offers various font weights, including bold, semibold, medium, regular, and light.

extension UIFont {
    
    /// Enum defining different font weights available for Poppins typeface.
    public enum FontWeight {
        case bold
        case semibold
        case medium
        case regular
        case light
    }
    
    /// Creates and returns a Poppins font with the specified size and weight.
    ///
    /// - Parameters:
    ///   - size: The preferred font size.
    ///   - weight: The desired font weight.
    /// - Returns: A Poppins font instance with the specified attributes, falling back to the system font if the requested Poppins font is unavailable.
    static func poppins(size: CGFloat, weight: FontWeight) -> UIFont {
        switch weight {
        case .bold:
            guard let font = UIFont(name: "Poppins-Bold", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        case .light:
            guard let font = UIFont(name: "Poppins-Light", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        case .medium:
            guard let font = UIFont(name: "Poppins-Medium", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        case .regular:
            guard let font = UIFont(name: "Poppins-Regular", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        case .semibold:
            guard let font = UIFont(name: "Poppins-Semibold", size: size) else {
                return systemFont(ofSize: size)
            }
            return font
        }
    }
}

