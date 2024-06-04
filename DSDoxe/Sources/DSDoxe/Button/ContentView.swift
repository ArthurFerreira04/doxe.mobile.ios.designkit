//
//  File.swift
//  
//
//  Created by Diego Lopes on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var fieldState: DoxeInputFieldState = .normal

    var body: some View {
        VStack(spacing: 20) {
            DoxeInputField(
                state: $fieldState,
                titleLabel: "Label",
                placeholder: "Place Holder",
                supportingText: "Texto de apoio",
                errorMessage: nil,
                leftIcon: "magnifyingglass",
                rightIcon: nil
            )
            
            DoxeInputField(
                state: $fieldState,
                titleLabel: "Label",
                placeholder: "Place Holder",
                supportingText: "Texto de apoio",
                errorMessage: nil,
                leftIcon: nil,
                rightIcon: "magnifyingglass"
            )
            
            DoxeInputField(
                state: $fieldState,
                titleLabel: "Label",
                placeholder: "Place Holder",
                supportingText: "Texto de apoio",
                errorMessage: "Mensagem de erro",
                leftIcon: "magnifyingglass",
                rightIcon: "magnifyingglass"
            )
            
            DoxeInputField(
                state: $fieldState,
                titleLabel: "Label",
                placeholder: "Place Holder",
                supportingText: "Texto de apoio",
                errorMessage: nil,
                leftIcon: nil,
                rightIcon: nil
            )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
