import SwiftUI

public extension View {
    func dsBorder(
        _ color: DSColor,
        width: CGFloat = 1,
        opacity: CGFloat = 1,
        radius: DSCornerRadius
    ) -> some View where Color: ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: radius)
        return clipShape(roundedRect)
            .overlay(
                roundedRect
                    .strokeBorder(color.color(), lineWidth: width)
                    .opacity(opacity)
            )
    }

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
