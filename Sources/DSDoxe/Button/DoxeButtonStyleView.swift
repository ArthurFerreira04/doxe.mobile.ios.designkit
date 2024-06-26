//
//  SwiftUIView.swift
//  
//
//  Created by Diego Lopes on 30/05/24.
//

import SwiftUI

public enum ButtonSizeStyle {
    case large, medium, small

    public var size: CGSize {
        switch self {
        case .large:
            return CGSize(width: 125, height: 56)
        case .medium:
            return CGSize(width: 125, height: 36)
        case .small:
            return CGSize(width: 117, height: 30)
        }
    }

    public var adjustedWidthWithoutImage: CGFloat {
        switch self {
        case .large:
            return 85
        case .medium:
            return 85
        case .small:
            return 85
        }
    }
}

public struct DoxeButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var borderColor: Color
    var textColor: Color
    var isFilled: Bool
    var sizeStyle: ButtonSizeStyle
    let cornerRadius: CGFloat = 8
    var isEnabled: Bool = true
    var isTransparent: Bool = false
    let fixedFontSize: CGFloat = 16
    var hasIcon: Bool

    public func makeBody(configuration: Configuration) -> some View {
        let currentBackgroundColor = !isEnabled ? Color.gray.opacity(0.2) : (isTransparent ? Color.clear : (isFilled ? backgroundColor : Color.clear))
        let currentBorderColor = !isEnabled ? Color.gray.opacity(0.0) : (isTransparent ? Color.clear : borderColor)
        let currentTextColor = !isEnabled ? Color.gray.opacity(0.5) : (isTransparent ? Color.clear : textColor)
        
        let width = hasIcon ? sizeStyle.size.width : sizeStyle.adjustedWidthWithoutImage

        return configuration.label
            .frame(width: width, height: sizeStyle.size.height)
            .padding()
            .background(currentBackgroundColor)
            .foregroundColor(currentTextColor)
            .font(.system(size: fixedFontSize))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(currentBorderColor, lineWidth: 2)
                    .background(isFilled ? Color.clear : backgroundColor.opacity(0.1))
            )
            .cornerRadius(cornerRadius)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .disabled(!isEnabled)
    }
}

