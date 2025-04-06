import SwiftUI

private struct ToastModifier: ViewModifier {
    @Binding var toast: DSToast?

    @State private var task: Task<Void, Never>?
    @State private var isShown = false

    func body(content: Content) -> some View {
        ZStack {
            content
                .overlay {
                    if toast != nil {
                        ZStack {
                            toastView()
                                .offset(y: isShown ? 80 : -80)
                                .animation(.spring(duration: 0.3), value: isShown)
                        }
                        .ignoresSafeArea()
                        .dsOnFirstAppear {
                            isShown = true
                            hideToast()
                        }
                    }
                }
        }
    }

    @ViewBuilder
    private func toastView() -> some View {
        VStack {
            ToastView(message: toast?.message ?? "")
            Spacer()
        }
    }

    private func hideToast() {
        guard let toast else { return }

        UIImpactFeedbackGenerator(style: .light).impactOccurred()

        task?.cancel()
        task = Task { @MainActor in
            try? await Task.sleep(for: .seconds(toast.duration))
            withAnimation(.easeOut(duration: 0.25)) {
                isShown = false
            }

            try? await Task.sleep(for: .seconds(0.25))
            self.toast = nil
        }
    }
}

public struct DSToast: Equatable {
    let message: String
    let duration: Double

    public init(
        message: String,
         duration: Double = 3.0
    ) {
        self.message = message
        self.duration = duration
    }
}

public extension View {
    func dsToast(
        _ toast: Binding<DSToast?>
    ) -> some View {
        modifier(ToastModifier(toast: toast))
    }
}
