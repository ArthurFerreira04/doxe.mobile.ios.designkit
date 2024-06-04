//
//  SwiftUIView.swift
//  
//
//  Created by Diego Lopes on 30/05/24.
//

import SwiftUI

struct DoxeButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var borderColor: Color
    var textColor: Color
    var isFilled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                isFilled ? backgroundColor : Color.clear
            )
            .foregroundColor(textColor)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(borderColor, lineWidth: 2)
                    .background(isFilled ? Color.clear : backgroundColor.opacity(0.1))
            )
            .cornerRadius(20)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}
