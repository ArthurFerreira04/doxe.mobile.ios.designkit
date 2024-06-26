//
//  SwiftUIView.swift
//  
//
//  Created by Diego Lopes on 04/06/24.
//

import SwiftUI

public struct DoxeCustomButton: View {
    var text: String
    var iconName: String?
    var action: () -> Void
    var backgroundColor: Color
    var borderColor: Color
    var textColor: Color
    var isFilled: Bool
    var sizeStyle: ButtonSizeStyle
    var isEnabled: Bool = true
    var isTransparent: Bool = false

    public init(
        text: String,
        iconName: String? = nil,
        action: @escaping () -> Void,
        backgroundColor: Color,
        borderColor: Color,
        textColor: Color,
        isFilled: Bool,
        sizeStyle: ButtonSizeStyle,
        isEnabled: Bool = true,
        isTransparent: Bool = false
    ) {
        self.text = text
        self.iconName = iconName
        self.action = action
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.textColor = textColor
        self.isFilled = isFilled
        self.sizeStyle = sizeStyle
        self.isEnabled = isEnabled
        self.isTransparent = isTransparent
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                if let iconName = iconName {
                    Image(systemName: iconName)
                }
                Text(text)
                    .font(.system(size: 16)) // Tamanho fixo do texto
            }
        }
        .buttonStyle(DoxeButtonStyle(
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            textColor: textColor,
            isFilled: isFilled,
            sizeStyle: sizeStyle,
            isEnabled: isEnabled,
            isTransparent: isTransparent,
            hasIcon: iconName != nil
        ))
        .disabled(!isEnabled)
    }
}
