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
            ZStack(alignment: .leading) {
                HStack {
                    if let leftIcon = leftIcon {
                        Image(systemName: leftIcon)
                            .foregroundColor(iconColor)
                            .padding(.leading, 8)
                    }

                    VStack(alignment: .leading, spacing: -4) {
                        Text(titleLabel)
                            .font(.custom("", size: 12))
                            .foregroundColor(state == .error ? .red : .black)
                            .padding(.leading, leftIcon == nil ? 8 : 8)
                            .background(Color.white.opacity(0.8))
                            

                        ZStack(alignment: .leading) {
                            if text.isEmpty {
                                Text(placeholder)
                                    .font(.custom("", size: 12)) 
                                    .foregroundColor(.gray)
                                    .padding(.leading, leftIcon == nil ? 8 : 8)
                            }
                            TextField("", text: $text, onEditingChanged: { isEditing in
                                if isEditing {
                                    self.state = .focused
                                } else if !text.isEmpty {
                                    self.state = .filled
                                } else {
                                    self.state = .normal
                                }
                            })
                            .font(.custom("", size: 12)) 
                            .padding(EdgeInsets(top: 4, leading: 8, bottom: 8, trailing: 12))
                            .foregroundColor(state == .error ? .red : .primary)
                        }
                    }

                    if let rightIcon = rightIcon {
                        Image(systemName: rightIcon)
                            .foregroundColor(iconColor)
                            .padding(.trailing, 8)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .background(RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(borderColor, lineWidth: 1)
                                .background(RoundedRectangle(cornerRadius: 12).fill(backgroundColor)))
            }

            if state != .error {
                Text(supportingText)
                    .font(.custom("", size: 12)) 
                    .foregroundColor(.gray)
            }

            if let errorMessage = errorMessage, state == .error {
                Text(errorMessage)
                    .font(.custom("", size: 12))
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
        .animation(.easeInOut, value: text.isEmpty)
    }

    private var borderColor: Color {
        switch state {
        case .normal:
            return .gray
        case .filled:
            return .purple
        case .focused:
            return .blue
        case .error:
            return .red
        }
    }

    private var backgroundColor: Color {
        return .white
    }

    private var iconColor: Color {
        return state == .error ? .red : .gray
    }
}
