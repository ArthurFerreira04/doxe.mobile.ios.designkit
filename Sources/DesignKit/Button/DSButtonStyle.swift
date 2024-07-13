import SwiftUI

public struct DSButtonStyle: ButtonStyle {
    var iconName: String?
    var style: DSButtonStyleType
    var size: DSButtonSize
    var state: DSButtonState

    public func makeBody(configuration: Configuration) -> some View {
        Group {
            if state == .loading {
                Circle()
                    .fill(Color.surface)
                    .frame(width: 50, height: 50)
                    .overlay(
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .accent))
                    )
            } else {
                HStack(spacing: Spacing.medium) {
                    if let iconName {
                        Image(systemName: iconName)
                            .foregroundStyle(iconColor())
                    }
                    configuration.label
                        .foregroundStyle(textColor())
                }
                .padding(.horizontal, Spacing.medium)
                .padding(.vertical, Spacing.tiny)
                .frame(height: height())
                .background(background(isPressed: configuration.isPressed))
                .foregroundStyle(foregroundStyle())
                .clipShape(.rect(cornerRadius: cornerRadius()))
                .overlay(border(isPressed: configuration.isPressed))
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            }
        }
        .animation(.default, value: state)
    }

    private func textColor() -> Color {
        switch style {
        case .filled:
            return state.isDisabled ? .onDisabled : .onAccent
        case .outlined, .text:
            return state.isDisabled ? .disabled : .accent
        }
    }

    private func iconColor() -> Color {
        switch style {
        case .filled:
            return state.isDisabled ? .onDisabled : .onAccent
        case .outlined, .text:
            return state.isDisabled ? .disabled : .accent
        }
    }

    private func background(isPressed: Bool) -> Color {
        switch style {
        case .filled:
            return state.isDisabled ? .disabled : (isPressed ? Color.accent.opacity(0.7) : Color.accent)
        case .outlined, .text:
            return .clear
        }
    }

    private func foregroundStyle() -> Color {
        switch style {
        case .filled:
            return state.isDisabled ? .onDisabled : .onAccent
        case .outlined, .text:
            return state.isDisabled ? .disabled : .accent
        }
    }

    private func border(isPressed: Bool) -> some View {
        switch style {
        case .outlined:
            return RoundedRectangle(cornerRadius: cornerRadius())
                .stroke(state.isDisabled ? .disabled : (isPressed ? Color.accent.opacity(0.7) : Color.accent), lineWidth: 2)
        case .filled, .text:
            return RoundedRectangle(cornerRadius: cornerRadius())
                .stroke(Color.clear, lineWidth: 0)
        }
    }

    private func cornerRadius() -> CGFloat {
        switch size {
        case .small:
            return 8
        case .medium:
            return 12
        case .large:
            return 16
        }
    }

    private func height() -> CGFloat {
        switch size {
        case .small:
            return 30
        case .medium:
            return 36
        case .large:
            return 56
        }
    }
}
