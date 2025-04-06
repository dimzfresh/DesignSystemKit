import Foundation

public protocol Haptic: Sendable {
    @MainActor var performHapticFeedback: @Sendable () async -> Void { get }
}

/// Represents a type of haptic and/or audio feedback that can be played.
///
/// This feedback can be passed to `View.hapticFeedback` to play it.
public struct HapticFeedback: Haptic {
    public var label: String
    public var performHapticFeedback: @Sendable () async -> Void

    public init(
        label: String,
        performHapticFeedback: @MainActor @escaping @Sendable () -> Void
    ) {
        self.label = label
        self.performHapticFeedback = performHapticFeedback
    }

    /// Perform feedback in Main Actor.
    public func perform() {
        Task { @MainActor in
            await self.performHapticFeedback()
        }
    }
}

public extension HapticFeedback {
    /// The flexibility to be represented by a type of feedback.
    ///
    /// Flexibility values can be passed to `HapticFeedback.impact(flexibility:intensity:)`.
    enum Flexibility: Int, Sendable {
        case rigid
        case solid
        case soft
    }

    /// The weight to be represented by a type of feedback.
    ///
    /// Weight values can be passed to `HapticFeedback.impact(weight:intensity:)`.
    enum Weight: Int, Sendable {
        case light
        case medium
        case heavy
    }
}

extension HapticFeedback: Equatable {
    public static func == (lhs: HapticFeedback, rhs: HapticFeedback) -> Bool {
        lhs.label == rhs.label
    }
}
