//
//  DatePickerABSA.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct DatePickerABSA: View {
    @State var text: String
    @State var dateRaw: Date
    @State var prompt: String
    @State var tint: Color
    @State var icon: String
    @State var showPicker: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { bounds in
                VStack {
                    HStack (spacing: 20){
                        Image(systemName: icon)
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        TextField("", text: $text)
                            .overlay {
                                if !showPicker && text == "" {
                                    HStack {
                                        Text(prompt)
                                            .foregroundStyle(.primary)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            .disabled(showPicker ? true : false)
                            .onTapGesture {withAnimation(.easeInOut){ showPicker.toggle()}}
                    }
                    .padding()
                    .frame(width: bounds.size.width - 60, height: 55)
                    .background {
                        RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                    }
                    .onTapGesture {withAnimation(.easeInOut){ showPicker.toggle()}}
                }
                .frame(width: bounds.size.width, height: bounds.size.height)
                .onChange(of: dateRaw) { initial in
                    text = formatDate()
                }
                
                
                if showPicker {
                    VStack {
                        Spacer()
                        
                        DateChooser(dateRaw: $dateRaw, trigger: $showPicker)
                    }
                    .transition(.move(edge: .bottom))
                }
                
                
            }
            .ignoresSafeArea()
        }
        .background(.clear)
        .tint(tint)

    }
    
    func formatDate() -> String {
        return dateRaw.format(date: dateRaw)
    }
}

#Preview {
    DatePickerABSA(text: "", dateRaw: .now, prompt: "Date of Birth", tint: .red, icon: "calendar", showPicker: false)
}
