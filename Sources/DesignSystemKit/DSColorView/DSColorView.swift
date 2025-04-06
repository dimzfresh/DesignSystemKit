import SwiftUI

public struct DSColorView: View {
    @Environment(\.colorScheme)
    private var colorScheme

    private let color: DSColor

    public var body: some View {
        color.color(for: colorScheme)
    }

    public init(_ color: DSColor) {
        self.color = color
    }
}
