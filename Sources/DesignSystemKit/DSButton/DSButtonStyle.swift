import SwiftUI

public protocol DSButtonStyle: ButtonStyle {}

public extension View {
    func dsButtonStyle<S>(_ style: S) -> some View where S: DSButtonStyle {
        buttonStyle(style)
    }
}
