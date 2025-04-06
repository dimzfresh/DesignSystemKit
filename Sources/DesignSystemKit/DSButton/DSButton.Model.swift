import Foundation

public extension DSButton {
    struct Model: Sendable {
        let content: ContentModel
        let style: StyleModel
    }
}

public extension DSButton.Model {
    static let primaryDefault = Self(content: .default, style: .primaryDefault)
    static let secondaryDefault = Self(content: .default, style: .secondaryDefault)
    static let ghostDefault = Self(content: .default, style: .ghostDefault)
}
