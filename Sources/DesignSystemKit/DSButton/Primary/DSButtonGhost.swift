import SwiftUI

public struct ButtonGostStyle: DSButtonStyle {
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

public extension DSButtonStyle where Self == ButtonGostStyle {
    static var ghost: Self { .init(model: .ghostDefault) }

    static func ghost(content: DSButton.ContentModel) -> Self {
        .init(model: .init(
            content: content,
            style: .ghostDefault
        ))
    }
}
