import SwiftUI

public struct DSSecondaryButton: DSButtonStyle {
    private let model: DSButton.Model

    public init(model: DSButton.Model) {
        self.model = model
    }

    public func makeBody(configuration: Configuration) -> some View {
        DSButtonView(
            model: model,
            configuration: configuration
        )
    }
}

public extension DSButtonStyle where Self == DSSecondaryButton {
    static var secondary: Self { .init(model: .secondaryDefault) }

    static func secondary(content: DSButton.ContentModel) -> Self {
        .init(model: .init(
            content: content,
            style: .secondaryDefault
        ))
    }
}
