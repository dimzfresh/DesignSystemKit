import SwiftUI

public extension View {
    func dsAccentColor(_ color: DSColor) -> some View {
        modifier(DSAccentColorModifier(color))
    }
}

struct DSAccentColorModifier: ViewModifier {
    private let color: DSColor

    @Environment(\.colorScheme)
    private var colorScheme

    func body(content: Content) -> some View {
        content
            .accentColor(color.color(for: colorScheme))
    }

    init(_ color: DSColor) {
        self.color = color
    }
}
