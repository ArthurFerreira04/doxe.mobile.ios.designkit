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
                options: ["Item list 01", "Item list 02", "Item list 03"],
                label: "Label",
                placeholder: "Place Holder",
                supportText: "Texto de apoio",
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
