//
//  MaskedTexField.swift
//  Customs
//
//  Created by Malick Moro-Samah on 29/04/2024.
//

import SwiftUI
import Combine

struct MaskedTextFieldView: View {
    @State private var text = ""
    
    var body: some View {
        TextField("Enter code", text: $text)
            .keyboardType(text.count <= 3 ? .default : .numberPad)
            .onReceive(Just(text)) { newValue in
                let filtered = newValue.uppercased().filter { "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-".contains($0) }
                if filtered != newValue {
                    self.text = filtered
                }
                
                if filtered.count == 3 && !filtered.contains("-") {
                    self.text += "-"
                } else if filtered.count == 13 && !filtered.suffix(9).contains("-") {
                    self.text += "-"
                }
            }
            .padding()
            .border(Color.gray, width: 1)
            .padding()
    }
}

struct MaskedTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        MaskedTextFieldView()
    }
}


#Preview {
    MaskedTextFieldView()
}
