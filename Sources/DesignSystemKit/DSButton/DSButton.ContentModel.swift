import SwiftUI

public extension DSButton {
    struct ContentModel: Sendable {
        var icon: Image?
    }
}

public extension DSButton.ContentModel {
    static let `default` = Self()
}
