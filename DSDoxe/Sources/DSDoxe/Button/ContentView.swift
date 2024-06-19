//
//  File.swift
//  
//
//  Created by Diego Lopes on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var state: DoxeInputFieldState = .filled

    var body: some View {
        VStack {
            DoxeInputField(
                state: $state,
                titleLabel: "Digite seu e-mail",
                placeholder: "email@gmail.com",
                supportingText: "Texto de apoio",
                errorMessage: "Mensagem de erro",
                leftIcon: "magnifyingglass",
                rightIcon: "magnifyingglass"
            )
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
