//
//  File.swift
//  
//
//  Created by Diego Lopes on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var emailState: DoxeInputFieldState = .normal
    var body: some View {
        VStack {
            DoxeInputField(state: $emailState,
                           titleLabel: "Adklakd",
                           placeholder: "kadmakdj",
                           supportingText: "Texto de apoiodsfsfs",
                           errorMessage: nil,
                           leftIcon: nil,
                           rightIcon: "square.and.arrow.up")
            .padding()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
