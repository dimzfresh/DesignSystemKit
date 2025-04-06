import SwiftUI

// swiftlint:disable identifier_name
public extension View {
    func dsShadow(
        _ color: DSColor,
        radius: DSCornerRadius = .s,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        modifier(DSShadowModifier(
            color: color,
            radius: radius,
            x: x,
            y: y
        ))
    }
}

struct DSShadowModifier: ViewModifier {
    private let color: DSColor
    private let radius: DSCornerRadius
    private let x: CGFloat
    private let y: CGFloat

    @Environment(\.colorScheme)
    private var colorScheme

    func body(content: Content) -> some View {
        content
            .shadow(
                color: color.color(for: colorScheme),
                radius: radius.rawValue,
                x: x,
                y: y
            )
    }

    init(
        color: DSColor,
        radius: DSCornerRadius,
        x: CGFloat,
        y: CGFloat
    ) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}
// swiftlint:enable identifier_name
