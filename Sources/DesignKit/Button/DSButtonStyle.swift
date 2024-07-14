import SwiftUI

public struct DSButtonStyle: ButtonStyle {
    private let loadingSize = 50.0

    var iconName: String?
    var style: DSButtonStyleType
    var size: DSButtonSize
    var state: DSButtonState

    public func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: Spacing.medium) {
            if state.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .accent))
            } else {
                if let iconName {
                    Image(systemName: iconName)
                        .foregroundStyle(iconColor())
                }
                configuration.label
                    .foregroundStyle(textColor())
            }
        }
        .padding(.horizontal, Spacing.medium)
        .padding(.vertical, Spacing.tiny)
        .frame(width: state.isLoading ? loadingSize : .infinity, height: state.isLoading ? loadingSize : height())
        .background(background(isPressed: configuration.isPressed))
        .foregroundStyle(foregroundStyle())
        .clipShape(.rect(cornerRadius: cornerRadius()))
        .overlay(border(isPressed: configuration.isPressed))
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.3), value: state)
    }

    internal func textColor() -> Color {
        switch style {
        case .filled:
            return state.isDisabled ? .onDisabled : .onAccent
        case .outlined, .text:
            return state.isDisabled ? .disabled : .accent
        }
    }

    internal func iconColor() -> Color {
        switch style {
        case .filled:
            return state.isDisabled ? .onDisabled : .onAccent
        case .outlined, .text:
            return state.isDisabled ? .disabled : .accent
        }
    }

    internal func background(isPressed: Bool) -> Color {
        guard !state.isLoading else {
            return .surface
        }

        switch style {
        case .filled:
            return state.isDisabled ? .disabled : (isPressed ? Color.accent.opacity(0.7) : Color.accent)
        case .outlined, .text:
            return .clear
        }
    }

    internal func foregroundStyle() -> Color {
        guard !state.isLoading else {
            return .onSurfaceHigh
        }

        switch style {
        case .filled:
            return state.isDisabled ? .onDisabled : .onAccent
        case .outlined, .text:
            return state.isDisabled ? .disabled : .accent
        }
    }

    internal func border(isPressed: Bool) -> some View {
        guard !state.isLoading else {
            return RoundedRectangle(cornerRadius: cornerRadius())
                .stroke(Color.clear, lineWidth: 0)
        }

        switch style {
        case .outlined:
            return RoundedRectangle(cornerRadius: cornerRadius())
                .stroke(state.isDisabled ? .disabled : (isPressed ? Color.accent.opacity(0.7) : Color.accent), lineWidth: 2)
        case .filled, .text:
            return RoundedRectangle(cornerRadius: cornerRadius())
                .stroke(Color.clear, lineWidth: 0)
        }
    }

    internal func cornerRadius() -> CGFloat {
        guard !state.isLoading else {
            return loadingSize
        }

        switch size {
        case .small:
            return 8
        case .medium:
            return 12
        case .large:
            return 16
        }
    }

    internal func height() -> CGFloat {
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
