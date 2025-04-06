import SwiftUI

/// Makes `.hapticFeedback` modifier available to Xcode's library,
/// allowing for improved auto-complete and discoverability.
public struct HapticFeedbackLibrary: @preconcurrency LibraryContentProvider {
    @State private var status: Status = .unknown

    @LibraryContentBuilder
    @MainActor
    public func modifiers(base: any View) -> [LibraryItem] {
        LibraryItem(
            base.dsHapticFeedback(.impact, trigger: status),
            title: "Haptic Feedback"
        )
        LibraryItem(
            base.dsHapticFeedback(trigger: status) { _, newValue in
                switch newValue {
                case .success: .success
                case .failure: .error
                default: nil
                }
            },
            title: "Dynamic Haptic Feedback"
        )
    }

    public enum Status: Int {
        case unknown = 0
        case success = 1
        case failure = 2
    }
}
