// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Str {
  /// Подтвердить
  internal static let confirm = Str.tr("Localizable", "confirm", fallback: "Подтвердить")
  /// Войти
  internal static let enter = Str.tr("Localizable", "enter", fallback: "Войти")
  /// Введите почту
  internal static let enterEmail = Str.tr("Localizable", "enterEmail", fallback: "Введите почту")
  /// Вход
  internal static let entry = Str.tr("Localizable", "entry", fallback: "Вход")
  /// example@email.com
  internal static let exampleEmail = Str.tr("Localizable", "exampleEmail", fallback: "example@email.com")
  /// Получить код
  internal static let getCode = Str.tr("Localizable", "getCode", fallback: "Получить код")
  /// Введите 4-х значный код,
  ///  отправленный на почту
  internal static let otpCodeLabel = Str.tr("Localizable", "OTPCodeLabel", fallback: "Введите 4-х значный код,\n отправленный на почту")
  /// Зарегистрироваться
  internal static let register = Str.tr("Localizable", "register", fallback: "Зарегистрироваться")
  /// Регистрация
  internal static let registration = Str.tr("Localizable", "registration", fallback: "Регистрация")
  /// Отправить ещё раз через
  internal static let resend = Str.tr("Localizable", "resend", fallback: "Отправить ещё раз через")
  /// Код подтверждения
  internal static let verificationCode = Str.tr("Localizable", "verificationCode", fallback: "Код подтверждения")
  /// Доброе утро!
  internal static let welcomeMessage = Str.tr("Localizable", "welcomeMessage", fallback: "Доброе утро!")
  /// Код введён неверно,
  ///  попробуйте еще раз
  internal static let wrongCode = Str.tr("Localizable", "wrongCode", fallback: "Код введён неверно,\n попробуйте еще раз")
  /// Неправильный адрес электронной почты, попробуйте ещё раз
  internal static let wrongEmail = Str.tr("Localizable", "wrongEmail", fallback: "Неправильный адрес электронной почты, попробуйте ещё раз")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Str {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
