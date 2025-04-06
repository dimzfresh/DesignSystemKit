import SwiftUI

public extension View {
    func dsScaleOnTap(
        duration: TimeInterval = 0.25,
        destinationScale: CGFloat = 0.98
    ) -> some View {
        modifier(DSScaleOnTapModifier(duration: duration, destinationScale: destinationScale))
    }
}

struct DSScaleOnTapModifier: ViewModifier {
    private let destinationScale: CGFloat
    private let duration: TimeInterval

    @State private var scale: CGFloat = 1

    init(
        duration: TimeInterval,
        destinationScale: CGFloat
    ) {
        self.duration = duration
        self.destinationScale = destinationScale
    }

    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                    .onChanged { _ in
                        withAnimation(.linear(duration: duration)) {
                            scale = destinationScale
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.linear(duration: duration)) {
                            scale = 1
                        }
                    }
            )
    }
}
