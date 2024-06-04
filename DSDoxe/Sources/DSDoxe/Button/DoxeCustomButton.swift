//
//  SwiftUIView.swift
//  
//
//  Created by Diego Lopes on 04/06/24.
//

import SwiftUI

struct DoxeCustomButton: View {
    var text: String
    var iconName: String
    var action: () -> Void
    var backgroundColor: Color
    var borderColor: Color
    var textColor: Color
    var isFilled: Bool

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                Text(text)
                    .font(.headline)
            }
        }
        .buttonStyle(DoxeButtonStyle(
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            textColor: textColor,
            isFilled: isFilled
        ))
    }
}
