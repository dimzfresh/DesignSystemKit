import SwiftUI

private struct DSOnFirstAppearModifier: ViewModifier {
    let perform: () -> Void
    @State private var isFirstTimeAppeared = true

    func body(content: Content) -> some View {
        content.onAppear {
            guard isFirstTimeAppeared else { return }

            isFirstTimeAppeared = false
            perform()
        }
    }
}

public extension View {
    func dsOnFirstAppear(perform: @escaping () -> Void) -> some View {
        modifier(DSOnFirstAppearModifier(perform: perform))
    }
}
