//
//  File.swift
//  
//
//  Created by Diego Lopes on 20/06/24.
//

import SwiftUI

enum DropdownState {
    case normal
    case selected
    case error
    case disabled
}

struct DoxeDropdown: View {
    @State private var selectedOption: String
    @State private var isPickerVisible: Bool = false
    @State private var state: DropdownState = .normal
    let options: [String]
    let label: String
    let placeholder: String
    let supportText: String
    let supportTextColor: Color
    let labelColor: Color
    let selectedColor: Color
    let errorColor: Color
    let disabledColor: Color
    let icon: Image
    let iconColor: Color

    init(
        options: [String],
        label: String = "Label",
        placeholder: String = "Place Holder",
        supportText: String = "Texto de apoio",
        supportTextColor: Color = .primary,
        labelColor: Color = .primary,
        selectedColor: Color = .secondary,
        errorColor: Color = .red,
        disabledColor: Color = .gray,
        icon: Image = Image(systemName: "chevron.down"),
        iconColor: Color = .purple
    ) {
        self.options = options
        self.label = label
        self.placeholder = placeholder
        self.supportText = supportText
        self.supportTextColor = supportTextColor
        self.labelColor = labelColor
        self.selectedColor = selectedColor
        self.errorColor = errorColor
        self.disabledColor = disabledColor
        self.icon = icon
        self.iconColor = iconColor
        self._selectedOption = State(initialValue: placeholder)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(label)
                        .foregroundColor(state == .error ? errorColor : labelColor)
                        .font(.headline)
                    Text(selectedOption)
                        .foregroundColor(state == .error ? errorColor : (selectedOption == placeholder ? selectedColor : labelColor))
                }
                Spacer()
                icon
                    .rotationEffect(.degrees(isPickerVisible ? 180 : 0))
                    .foregroundColor(state == .error ? errorColor : iconColor)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke(state == .error ? errorColor : Color.gray, lineWidth: 1)
                .background(state == .disabled ? disabledColor.opacity(0.3) : Color.white)
                .cornerRadius(10)
            )
            .onTapGesture {
                if state != .disabled {
                    withAnimation {
                        isPickerVisible.toggle()
                    }
                }
            }

            if isPickerVisible {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .border(Color.gray.opacity(0.3), width: 0.5)
                            .onTapGesture {
                                selectedOption = option
                                isPickerVisible = false
                                state = .selected
                            }
                    }
                }
                .background(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
                    .background(Color.white)
                    .cornerRadius(10)
                )
                .padding(.top, -10)
                .transition(.opacity)
            }

            if !isPickerVisible {
                Text(supportText)
                    .foregroundColor(state == .error ? errorColor : supportTextColor)
                    .padding(.top, 4)
                    .font(.footnote)
            }
        }
        .padding()
        .disabled(state == .disabled)
    }
}
