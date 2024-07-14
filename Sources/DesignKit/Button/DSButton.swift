import SwiftUI

public struct DSButton: View {
    @Binding var state: DSButtonState

    var title: String
    var iconName: String
    var style: DSButtonStyleType
    var size: DSButtonSize
    var action: () -> Void

    public init(
        state: Binding<DSButtonState>,
        title: String,
        iconName: String,
        style: DSButtonStyleType,
        size: DSButtonSize,
        action: @escaping () -> Void
    ) {
        self._state = state
        self.title = title
        self.iconName = iconName
        self.style = style
        self.size = size
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
        }
        .buttonStyle(
            DSButtonStyle(
                iconName: iconName, 
                style: style,
                size: size, 
                state: state
            )
        )
        .disabled(state.isDisabled)
    }
}

#Preview {
    struct Preview: View {
        @State private var buttonState: DSButtonState = .normal

        var body: some View {
            DSButton(
                state: $buttonState,
                title: "Compartilhar",
                iconName: "square.and.arrow.up",
                style: .outlined,
                size: .large
            ) {
                withAnimation {
                    buttonState = .loading
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        buttonState = .normal
                    }
                }
            }
        }
    }

    return Preview()
}
