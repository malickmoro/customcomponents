//
//  SecureFieldTelecelPay.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct SecureFieldTelecelPay: View {
    @FocusState var tfocus
    @FocusState var sfocus
    @State var text: String
    @State var prompt: String
    @State var offsetValue: CGSize = .zero
    @State var reveal: Bool = false
    @Namespace var namespace
    @Environment (\.colorScheme) var scheme
    
    var focusedPrompt: some View {
        Text(prompt)
            .font(.subheadline)
            .foregroundStyle(.primary)
            .frame(width: 65)
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
                if reveal {
                    TextField("", text: $text)
                        .focused($tfocus)
                        .overlay {
                            HStack {
                                if !tfocus && text == "" {
                                    unfocusedPrompt
                                        .matchedGeometryEffect(id: "prompt", in: namespace)
                                } else {
                                    focusedPrompt
                                        .matchedGeometryEffect(id: "prompt", in: namespace)
                                }
                                
                                
                                Spacer()
                                
                                
                                Button{ reveal.toggle(); sfocus = true }label: {
                                    Image(systemName: reveal ? "eye.fill" :  "eye.slash.fill")
                                        .resizable()
                                        .frame(width: 25, height: reveal ? 17 : 20)
                                        .foregroundColor(.primary)
                                }
                            }
                            
                        }
                        .onTapGesture {
                            if !tfocus{
                                withAnimation(.easeInOut) {
                                   tfocus = true
                                }
                            } else {tfocus = false}
                        }
                        .onChange(of: tfocus) { focused in
                            if text.isEmpty {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    offsetValue = focused ? CGSize(width: -8, height: -30) : .zero
                                }
                            }
                        }
                        .padding()
                        .frame(width: bounds.size.width - 60, height: 55)
                        .background {
                            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                        }
                } else {
                    SecureField("", text: $text)
                        .focused($sfocus)
                        .overlay {
                            HStack {
                                if !sfocus && text == "" {
                                    unfocusedPrompt
                                        .matchedGeometryEffect(id: "prompt", in: namespace)
                                } else {
                                    
                                    focusedPrompt
                                        .matchedGeometryEffect(id: "prompt", in: namespace)
                                }
                                
                                
                                Spacer()
                                
                                
                                Button{ reveal.toggle(); tfocus = true } label: {
                                    Image(systemName: reveal ? "eye.fill" :  "eye.slash.fill")
                                        .resizable()
                                        .frame(width: 25, height: reveal ? 17 : 20)
                                        .foregroundColor(.primary)
                                    
                                }
                            }
                            
                        }
                        .onTapGesture {
                            if !sfocus{
                                withAnimation(.easeInOut) {
                                  sfocus = true
                                }
                            } else { sfocus = false}
                        }
                        .onChange(of: sfocus) { focused in
                            withAnimation(.easeInOut(duration: 0.3)) {
                                offsetValue = focused ? CGSize(width: -8, height: -30) : .zero
                            }
                        }
                        .padding()
                        .frame(width: bounds.size.width - 60, height: 55)
                        .background {
                            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                        }
                }
            }
            .frame(width: bounds.size.width, height: bounds.size.height)
        }
    }
    
    enum FieldToFocus {
        case secureField, textField
    }
}

#Preview {
    SecureFieldTelecelPay(text: "", prompt: "Password")
}
