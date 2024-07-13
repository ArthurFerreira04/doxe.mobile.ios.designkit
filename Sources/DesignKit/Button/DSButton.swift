import SwiftUI

public struct DSButton: View {
    @Binding var state: DSButtonState

    var title: String
    var iconName: String
    var style: DSButtonStyleType
    var size: DSButtonSize
    var action: () -> Void

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

struct DSButton_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State private var buttonState: DSButtonState = .normal

        var body: some View {
            DSButton(
                state: $buttonState,
                title: "Teste",
                iconName: "square.and.arrow.up",
                style: .filled,
                size: .large
            ) {
            }
        }
    }
}
