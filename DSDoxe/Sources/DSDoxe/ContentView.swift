//
//  File.swift
//  
//
//  Created by Diego Lopes on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DoxeDropdown(
                options: ["Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira"],
                label: "Qual dia você pode participar?",
                placeholder: "Dia disponivel",
                supportText: "Escolha o dia da semana",
                supportTextColor: .primary,
                labelColor: .primary,
                selectedColor: .secondary,
                errorColor: .red,
                disabledColor: .gray,
                icon: Image(systemName: "chevron.down"),
                iconColor: .purple
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
