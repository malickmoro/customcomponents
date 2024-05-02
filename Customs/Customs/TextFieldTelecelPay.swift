//
//  TextFieldTelecelPay.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct TextFieldTelecelPay: View {
    @FocusState var isfocused
    @State var text: String
    @State var prompt: String
    @State var offsetValue: CGSize = .zero
    @Namespace var namespace
    @Environment (\.colorScheme) var scheme
    
    var focusedPrompt: some View {
        Text(prompt)
            .font(.subheadline)
            .foregroundStyle(.primary)
            .padding(.horizontal, 5)
            .background(scheme == .dark ? .black : .white)
            .fontDesign(.rounded)
            .offset(offsetValue)
    }
    
    var unfocusedPrompt: some View {
        Text(prompt)
            .font(.system(size: 16))
            .foregroundStyle(.primary)
            .fontDesign(.rounded)
            .offset(offsetValue)
    }
    
    var body: some View {
        GeometryReader { bounds in
            VStack {
                TextField("", text: $text)
                    .focused($isfocused)
                    .overlay {
                        HStack {
                            if !isfocused && text == "" {
                                unfocusedPrompt
                                    .matchedGeometryEffect(id: "prompt", in: namespace)
                                
                            } else {
                               focusedPrompt
                                    .matchedGeometryEffect(id: "prompt", in: namespace)
                            }
                            
                            Spacer()
                        }
                        .onTapGesture {
                            if !isfocused {
                                withAnimation(.easeInOut) {
                                    isfocused = true
                                }
                            }
                        }
                        .onChange(of: isfocused) { focused in
                            if text.isEmpty {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    offsetValue = focused ? CGSize(width: -8, height: -30) : .zero
                                }
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
    }
}

#Preview {
    TextFieldTelecelPay(text: "", prompt: "Username or phone number")
}
