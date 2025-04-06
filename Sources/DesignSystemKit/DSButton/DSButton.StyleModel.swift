import SwiftUI

public extension DSButton {
    struct StyleModel: Sendable {
        let `default`: ColorSet
        let pressed: ColorSet
        let disabled: ColorSet
        let style: Style
        let size: Size
        let sizeToFit: Bool
        let iconPosition: IconPosition

        public func colorSet(
            isEnabled: Bool,
            isSelected: Bool
        ) -> StyleModel.ColorSet {
            switch (isEnabled, isSelected) {
            case (true, false): `default`
            case (true, true): pressed
            case (false, _): disabled
            }
        }

        public struct ColorSet: Sendable {
            let container: DSColor
            let title: DSColor
        }
    }
}

public extension DSButton.StyleModel {
    enum IconPosition: Sendable {
        case left
        case right
        case none
    }

    enum Style: Sendable {
        case primary
        case secondary
        case ghost
    }

    enum Size: Sendable {
        case s
        case m
        case l

        var value: CGFloat {
            switch self {
            case .s: 40
            case .m: 48
            case .l: 56
            }
        }
    }
}

public extension DSButton.StyleModel {
    static let primaryDefault = Self(
        default: .init(
            container: .background(.green),
            title: .textAndIcons(.white)
        ),
        pressed: .init(
            container: .background(.green),
            title: .textAndIcons(.white)
        ),
        disabled: .init(
            container: .background(.disabled),
            title: .textAndIcons(.white)
        ),
        style: .primary,
        size: .l,
        sizeToFit: false,
        iconPosition: .none
    )

    static let secondaryDefault = Self(
        default: .init(
            container: .background(.white),
            title: .textAndIcons(.green)
        ),
        pressed: .init(
            container: .background(.disabled),
            title: .textAndIcons(.green)
        ),
        disabled: .init(
            container: .background(.white),
            title: .textAndIcons(.secondary)
        ),
        style: .secondary,
        size: .l,
        sizeToFit: false,
        iconPosition: .none
    )

    static let ghostDefault = Self(
        default: .init(
            container: .clear,
            title: .textAndIcons(.primary)
        ),
        pressed: .init(
            container: .clear,
            title: .textAndIcons(.primary)
        ),
        disabled: .init(
            container: .clear,
            title: .textAndIcons(.secondary)
        ),
        style: .ghost,
        size: .l,
        sizeToFit: false,
        iconPosition: .none
    )
}
