import SwiftUI

public struct ButtonPrimaryStyle: DSButtonStyle {
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

public extension DSButtonStyle where Self == ButtonPrimaryStyle {
    static var primary: Self { .init(model: .primaryDefault) }

    static func primary(content: DSButton.ContentModel) -> Self {
        .init(model: .init(
            content: content,
            style: .primaryDefault
        ))
    }
}
