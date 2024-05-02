//
//  TextFieldUBA.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct TextFieldUBA: View {
    @State var text: String
    @State var prompt: String
    @State var tint: Color
    @State var icon: String
    @FocusState var isfocused
    
    var body: some View {
        GeometryReader { bounds in
            VStack {
                HStack (spacing: 20){
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    TextField("", text: $text)
                        .focused($isfocused)
                        .overlay {
                            if !isfocused && text == "" {
                                HStack {
                                    Text(prompt)
                                        .foregroundStyle(.primary)
                                    
                                    Spacer()
                                }
                                .onTapGesture {withAnimation(.easeInOut){ isfocused.toggle()}}
                            }
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
    TextFieldUBA(text: "", prompt: "Username", tint: Color.yellow, icon: "person")
}
