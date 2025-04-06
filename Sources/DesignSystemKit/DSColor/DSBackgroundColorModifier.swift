import SwiftUI

public extension View {
    func dsBackgroundColor(_ color: DSColor) -> some View {
        modifier(DSBackgroundColorModifier(color))
    }
}

struct DSBackgroundColorModifier: ViewModifier {
    private let color: DSColor

    @Environment(\.colorScheme)
    private var colorScheme

    func body(content: Content) -> some View {
        content
            .background(color.color(for: colorScheme))
    }

    init(_ color: DSColor) {
        self.color = color
    }
}
