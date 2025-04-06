import SwiftUI

struct DSButtonView: View {
    let model: DSButton.Model
    let configuration: ButtonStyle.Configuration

    @Environment(\.isEnabled)
    private var isEnabled: Bool
    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass

    var body: some View {
        HStack(spacing: .xs) {
            if let icon = model.content.icon, model.style.iconPosition == .left {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
            }

            configuration
                .label
                .multilineTextAlignment(.center)

            if let icon = model.content.icon, model.style.iconPosition == .right {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 24)
            }
        }
        .font(.system(size: 18, weight: .medium))
        .dsForegroundColor(
            model.style.colorSet(isEnabled: isEnabled, isSelected: configuration.isPressed).title
        )
        .dsPadding(.l, edges: .horizontal)
        .frame(height: model.style.size.value)
        .frame(
            minWidth: .zero,
            maxWidth: model.style.sizeToFit
            ? nil
            : horizontalSizeClass == .compact ? .infinity : 343
        )
        .dsBackgroundColor(
            model.style.colorSet(isEnabled: isEnabled, isSelected: configuration.isPressed).container
        )
        .dsCornerRadius(.round)
        .shadow(color: .gray.opacity(0.1), radius: 4)
        .dsScaleOnTap()
    }
}
