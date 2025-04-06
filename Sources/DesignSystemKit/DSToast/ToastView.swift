import SwiftUI

struct ToastView: View {
    let message: String

    var body: some View {
        HStack(spacing: .s) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 16, height: 16)
                .scaledToFill()
                .dsForegroundColor(.background(.beige))
                .dsPadding(.l, edges: .leading)

            Text(message)
                .dsFont(.bodyMRegular)
                .dsForegroundColor(.background(.beige))
                .dsPadding(.l, edges: .trailing)
        }
        .frame(height: 40)
        .dsBackgroundColor(.background(.green))
        .dsCornerRadius(.round)
        .opacity(0.95)
        .fixedSize(horizontal: true, vertical: true)
        .dsShadow(.background(.secondary), radius: .s, x: 0, y: 2)
        .dsPadding(.l, edges: .horizontal)
    }
}
