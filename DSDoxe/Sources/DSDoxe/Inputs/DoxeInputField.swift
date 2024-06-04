//
//  SwiftUIView.swift
//  
//
//  Created by Diego Lopes on 04/06/24.
//

import SwiftUI

enum DoxeInputFieldState {
    case normal
    case filled
    case focused
    case error
}

struct DoxeInputField: View {
    @State private var text: String = ""
    @Binding var state: DoxeInputFieldState
    var titleLabel: String
    var placeholder: String
    var supportingText: String
    var errorMessage: String?
    var leftIcon: String?
    var rightIcon: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                if let leftIcon = leftIcon {
                    Image(systemName: leftIcon)
                        .foregroundColor(iconColor)
                }
                
                TextField(placeholder, text: $text, onEditingChanged: { isEditing in
                    if isEditing {
                        self.state = .focused
                    } else if !text.isEmpty {
                        self.state = .filled
                    } else {
                        self.state = .normal
                    }
                })
                .foregroundColor(state == .error ? .red : .primary)
                
                if let rightIcon = rightIcon {
                    Image(systemName: rightIcon)
                        .foregroundColor(iconColor)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(borderColor, lineWidth: 2)
                            .background(RoundedRectangle(cornerRadius: 8).fill(backgroundColor)))
            
            
            Text(supportingText)
                .font(.footnote)
                .foregroundColor(.gray)
            
            if let errorMessage = errorMessage, state == .error {
                Text(errorMessage)
                    .font(.footnote)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
    }
    
    private var borderColor: Color {
        switch state {
        case .normal:
            return .clear
        case .filled:
            return .purple
        case .focused:
            return .gray
        case .error:
            return .red
        }
    }
    
    private var backgroundColor: Color {
        return state == .focused ? Color.blue.opacity(0.1) : Color.clear
    }
    
    private var iconColor: Color {
        return state == .error ? .red : .gray
    }
}
