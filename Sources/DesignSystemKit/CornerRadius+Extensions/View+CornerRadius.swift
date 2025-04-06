import SwiftUI

public extension View {
    /// Applies a corner radius to the view using the design system's predefined corner radius values.
    ///
    /// - Parameter radius: The corner radius to apply, using the `CornerRadius` enum from the design system.
    /// - Returns: A view with the specified corner radius applied.
    func dsCornerRadius(_ radius: DSCornerRadius) -> some View {
        cornerRadius(radius.rawValue)
    }
}

public extension RoundedRectangle {
    /// Creates a rounded rectangle with a corner radius defined by the design system.
    ///
    /// - Parameter cornerRadius: The corner radius to use, using the `CornerRadius` enum from the design system.
    @inlinable
    init(cornerRadius: DSCornerRadius) {
        self.init(cornerRadius: cornerRadius.rawValue)
    }
}

public extension View {
    @inlinable
    @ViewBuilder
    func dsCornerRadius(
        _ radius: DSCornerRadius,
        corners: UIRectCorner
    ) -> some View {
        clipShape(.rect(
            topLeadingRadius: corners.contains(.topLeft) ? radius.rawValue : .zero,
            bottomLeadingRadius: corners.contains(.bottomLeft) ? radius.rawValue : .zero,
            bottomTrailingRadius: corners.contains(.bottomRight) ? radius.rawValue : .zero,
            topTrailingRadius: corners.contains(.topRight) ? radius.rawValue : .zero
        ))
    }
}

@usableFromInline
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    @usableFromInline
    init(
        radius: CGFloat = .infinity,
        corners: UIRectCorner = .allCorners
    ) {
        self.radius = radius
        self.corners = corners
    }

    @usableFromInline
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
