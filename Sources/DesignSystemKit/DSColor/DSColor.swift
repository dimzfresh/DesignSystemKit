import SwiftUI

public enum DSColor: Sendable {
    case textAndIcons(TextAndIcons)
    case background(Background)
    case accent(Accent)
    case technical(Technical)
    case clear
    case dynamic(light: Color, dark: Color)

    // swiftlint:disable cyclomatic_complexity
    public func color(for colorScheme: ColorScheme = .light) -> Color {
        switch self {
        case let .textAndIcons(type):
            switch type {
            case .primary: .init(.TextAndIcons.primary)
            case .secondary: .init(.TextAndIcons.secondary)
            case .green: .init(.TextAndIcons.green)
            case .white: .init(.TextAndIcons.white)
            case .gray: .init(.TextAndIcons.gray)
            }
        case let .background(type):
            switch type {
            case .primary: .init(.Background.green)
            case .secondary: .init(.Background.disabled)
            case .black: .init(.Background.black)
            case .white: .init(.Background.white)
            case .beige: .init(.Background.beige)
            case .peach: .init(.Background.peach)
            case .green: .init(.Background.green)
            case .disabled: .init(.Background.disabled)
            }
        case let .accent(type):
            switch type {
            case .accent: .init(.Accent.accent)
            case .green: .init(.Accent.green)
            }
        case let .technical(type):
            switch type {
            case .error: .init(.Technical.error)
            }
        case .clear: .clear
        case let .dynamic(light, dark): colorScheme == .dark ? dark : light
        }
    }
    // swiftlint:enable cyclomatic_complexity

    public enum TextAndIcons: Sendable {
        case primary
        case secondary
        case green
        case white
        case gray
    }

    public enum Background: Sendable {
        case primary
        case secondary
        case beige
        case black
        case peach
        case green
        case white
        case disabled
    }

    public enum Accent: Sendable {
        case accent
        case green
    }

    public enum Technical: Sendable {
        case error
    }
}
