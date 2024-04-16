// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
    import AppKit
#elseif os(iOS)
    import UIKit
#elseif os(tvOS) || os(watchOS)
    import UIKit
#endif
#if canImport(SwiftUI)
    import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
enum Asset {
    static let accentColor = ColorAsset(name: "AccentColor")
    static let colorDarkBlue = ColorAsset(name: "colorDarkBlue")
    static let colorDarkGray = ColorAsset(name: "colorDarkGray")
    static let colorGray = ColorAsset(name: "colorGray")
    static let colorMain = ColorAsset(name: "colorMain")
    static let colorOrange = ColorAsset(name: "colorOrange")
    static let colorRed = ColorAsset(name: "colorRed")
    static let colorSecondDarkBlue = ColorAsset(name: "colorSecondDarkBlue")
    static let colorTitle = ColorAsset(name: "colorTitle")
    static let colorWhite = ColorAsset(name: "colorWhite")
    static let colorYellow = ColorAsset(name: "colorYellow")
    static let basketEmptyImage = ImageAsset(name: "basketEmptyImage")
    static let branchArrowDown = ImageAsset(name: "BranchArrowDown")
    static let branchArrowUp = ImageAsset(name: "BranchArrowUp")
    static let branchImage = ImageAsset(name: "BranchImage")
    static let branchLocationImage = ImageAsset(name: "BranchLocationImage")
    static let branchPhoneImage = ImageAsset(name: "BranchPhoneImage")
    static let arrowBack = ImageAsset(name: "arrowBack")
    static let bakering = ImageAsset(name: "bakering")
    static let basket = ImageAsset(name: "basket")
    static let bottomBean = ImageAsset(name: "bottom-bean")
    static let branch = ImageAsset(name: "branch")
    static let cafeImage = ImageAsset(name: "cafeImage")
    static let categoryBeanItem = ImageAsset(name: "categoryBeanItem")
    static let categoryCruasanItem = ImageAsset(name: "categoryCruasanItem")
    static let categoryDesertItem = ImageAsset(name: "categoryDesertItem")
    static let categoryDrinkItem = ImageAsset(name: "categoryDrinkItem")
    static let checkMark = ImageAsset(name: "checkMark")
    static let cofe = ImageAsset(name: "cofe")
    static let cofe1 = ImageAsset(name: "cofe1")
    static let cofe2 = ImageAsset(name: "cofe2")
    static let cofeeLogo = ImageAsset(name: "cofeeLogo")
    static let coffeeBeans = ImageAsset(name: "coffee-beans")
    static let cupOfCofe = ImageAsset(name: "cupOfCofe")
    static let desert = ImageAsset(name: "desert")
    static let dog = ImageAsset(name: "dog")
    static let drink = ImageAsset(name: "drink")
    static let dropSign = ImageAsset(name: "dropSign")
    static let exit = ImageAsset(name: "exit")
    static let home = ImageAsset(name: "home")
    static let ingredientsImage = ImageAsset(name: "ingredientsImage")
    static let neocafe = ImageAsset(name: "neocafe")
    static let orderHistory = ImageAsset(name: "orderHistory")
    static let profile = ImageAsset(name: "profile")
    static let profileBonusImage = ImageAsset(name: "profileBonusImage")
    static let profileEdit = ImageAsset(name: "profileEdit")
    static let profileExit = ImageAsset(name: "profileExit")
    static let tea = ImageAsset(name: "tea")
    static let topBean = ImageAsset(name: "top-bean")
}

// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

final class ColorAsset {
    fileprivate(set) var name: String

    #if os(macOS)
        typealias Color = NSColor
    #elseif os(iOS) || os(tvOS) || os(watchOS)
        typealias Color = UIColor
    #endif

    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    private(set) lazy var color: Color = {
        guard let color = Color(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()

    #if os(iOS) || os(tvOS)
        @available(iOS 11.0, tvOS 11.0, *)
        func color(compatibleWith traitCollection: UITraitCollection) -> Color {
            let bundle = BundleToken.bundle
            guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
                fatalError("Unable to load color asset named \(name).")
            }
            return color
        }
    #endif

    #if canImport(SwiftUI)
        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
        private(set) lazy var swiftUIColor: SwiftUI.Color = .init(asset: self)
    #endif

    fileprivate init(name: String) {
        self.name = name
    }
}

extension ColorAsset.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init?(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
            self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            self.init(named: NSColor.Name(asset.name), bundle: bundle)
        #elseif os(watchOS)
            self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    extension SwiftUI.Color {
        init(asset: ColorAsset) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle)
        }
    }
#endif

struct ImageAsset {
    fileprivate(set) var name: String

    #if os(macOS)
        typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
        typealias Image = UIImage
    #endif

    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
    var image: Image {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
            let image = Image(named: name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            let name = NSImage.Name(self.name)
            let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
        #elseif os(watchOS)
            let image = Image(named: name)
        #endif
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }

    #if os(iOS) || os(tvOS)
        @available(iOS 8.0, tvOS 9.0, *)
        func image(compatibleWith traitCollection: UITraitCollection) -> Image {
            let bundle = BundleToken.bundle
            guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
                fatalError("Unable to load image asset named \(name).")
            }
            return result
        }
    #endif

    #if canImport(SwiftUI)
        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
        var swiftUIImage: SwiftUI.Image {
            SwiftUI.Image(asset: self)
        }
    #endif
}

extension ImageAsset.Image {
    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
    @available(macOS, deprecated,
               message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init?(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
            let bundle = BundleToken.bundle
            self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            self.init(named: NSImage.Name(asset.name))
        #elseif os(watchOS)
            self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    extension SwiftUI.Image {
        init(asset: ImageAsset) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle)
        }

        init(asset: ImageAsset, label: Text) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle, label: label)
        }

        init(decorative asset: ImageAsset) {
            let bundle = BundleToken.bundle
            self.init(decorative: asset.name, bundle: bundle)
        }
    }
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
