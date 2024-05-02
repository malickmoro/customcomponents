//
//  PasswordFieldUBA.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct SecureFieldUBA: View {
    @State var text: String
    @State var prompt: String
    @State var tint: Color
    @State var icon: String
    @State var reveal: Bool = false
    @FocusState var isfocused
    
    var body: some View {
        GeometryReader { bounds in
            VStack {
                HStack (spacing: 20){
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    if reveal {
                        TextField("", text: $text)
                            .focused($isfocused)
                            .overlay {
                                if !isfocused && text == "" {
                                    HStack {
                                        Text(prompt)
                                        
                                        
                                        Spacer()
                                    }
                                    .onTapGesture {withAnimation(.easeInOut){ isfocused.toggle()}}
                                }
                            }
                        }
                    else { SecureField("", text: $text)
                            .focused($isfocused)
                            .overlay {
                                if !isfocused && text == "" {
                                    HStack {
                                        Text("Password")
                                        
                                        
                                        Spacer()
                                    }
                                    .onTapGesture {isfocused.toggle()}
                                }
                            }
                    }
                        
                    
                    Button{ reveal.toggle() }label: {
                        Image(systemName: reveal ? "eye.fill" :  "eye.slash.fill")
                            .resizable()
                            .frame(width: 25, height: reveal ? 17 : 20)
                            .foregroundColor(.primary)
                    }
                    
                }
                .padding()
                .frame(width: bounds.size.width - 60, height: 55)
                .background {
                    RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                }
            }
            .frame(width: bounds.size.width, height: bounds.size.height)
        }
        .background(.clear)
        .tint(tint)
    }
}

#Preview {
    SecureFieldUBA(text: "", prompt: "Password", tint: Color.black, icon: "lock.open")
}
