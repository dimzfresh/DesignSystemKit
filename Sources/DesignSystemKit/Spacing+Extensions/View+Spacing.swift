import SwiftUI

public extension View {
    /// Applies padding to the view using the design system's predefined spacing values.
    ///
    /// - Parameters:
    ///   - spacing: The amount of padding to apply, using the `Spacing` enum from the design system.
    ///   - edges: The edges to apply the padding to. Defaults to `.all`.
    /// - Returns: A view with the specified padding applied.
    func dsPadding(_ spacing: DSSpacing, edges: Edge.Set = .all) -> some View {
        padding(edges, spacing.rawValue)
    }
}
