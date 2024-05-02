//
//  OptionSelectionABSA.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct OptionSelectionABSA: View {
    @State var text: String
    @State var prompt: String
    @State var tint: Color
    @State var showList: Bool = false
    
    var body: some View {
        GeometryReader { bounds in
            VStack {
                HStack (spacing: 20){
                    TextField("", text: $text)
                        .overlay {
                            if !showList && text == "" {
                                HStack {
                                    Text(prompt)
                                        .foregroundStyle(.primary)
                                    
                                    Spacer()
                                }
                            }
                        }
                        .disabled(true)
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 15, height: 10)
                        .bold()
                }
                .padding()
                .frame(width: bounds.size.width - 60, height: 55)
                .background {
                    RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                }
                .onTapGesture {withAnimation(.easeInOut){ showList.toggle()}}
            }
            .frame(width: bounds.size.width, height: bounds.size.height)
            .fullScreenCover(isPresented: $showList, content: {
               OptionsScreen(show: $showList, selected: $text)
            })
        }
        .background(.clear)
        .tint(tint)

    }
}

#Preview {
    OptionSelectionABSA(text: "", prompt: "ID Type", tint: .indigo)
}
