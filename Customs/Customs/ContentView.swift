//
//  ContentView.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var pass: String = ""
    

    var body: some View {
        VStack {
            TextFieldTelecelPay(text: "", prompt: "Username or phone number")
            
            SecureFieldTelecelPay(text: "", prompt: "Password")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
