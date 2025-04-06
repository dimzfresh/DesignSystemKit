import SwiftUI

public extension View {
    func dsTintColor(_ color: DSColor) -> some View {
        modifier(DSTintColorModifier(color))
    }
}

struct DSTintColorModifier: ViewModifier {
    private let color: DSColor

    @Environment(\.colorScheme)
    private var colorScheme

    func body(content: Content) -> some View {
        content
            .tint(color.color(for: colorScheme))
    }

    init(_ color: DSColor) {
        self.color = color
    }
}
