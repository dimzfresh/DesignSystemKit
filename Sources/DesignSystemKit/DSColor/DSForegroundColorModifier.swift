import SwiftUI

public extension View {
    func dsForegroundColor(_ color: DSColor) -> some View {
        modifier(DSForegroundColorModifier(color))
    }
}

struct DSForegroundColorModifier: ViewModifier {
    private let color: DSColor

    @Environment(\.colorScheme)
    private var colorScheme

    func body(content: Content) -> some View {
        content
            .foregroundStyle(color.color(for: colorScheme))
    }

    init(_ color: DSColor) {
        self.color = color
    }
}
