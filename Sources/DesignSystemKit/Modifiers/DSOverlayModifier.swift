import SwiftUI

public extension View {
    func dsOverlay(_ color: DSColor) -> some View {
        modifier(DSOverlayModifier(dsColor: color))
    }
}

struct DSOverlayModifier: ViewModifier {
    private let dsColor: DSColor

    @Environment(\.colorScheme)
    private var colorScheme

    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .foregroundColor(dsColor.color(for: colorScheme))
            )
    }

    init(dsColor: DSColor) {
        self.dsColor = dsColor
    }
}
