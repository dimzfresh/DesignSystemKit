import SwiftUI

public extension VStack {
    /// - Parameters:
    ///   - spacing: The amount of padding to apply, using the `Spacing` enum from the design system.
    ///   - alignment: The guide for aligning the subviews in this stack. This
    ///     guide has the same vertical screen coordinate for every subview.
    ///   - content: A view builder that creates the content of this stack.
    /// - Returns: A VStack with the specified spacing applied.
    @inlinable
    init(
        spacing: DSSpacing,
        alignment: HorizontalAlignment = .center,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.rawValue,
            content: content
        )
    }
}
