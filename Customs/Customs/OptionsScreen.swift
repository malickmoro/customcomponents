//
//  OptionsScreen.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct OptionsScreen: View {
    @Environment (\.colorScheme) var scheme
    @Binding var show: Bool
    @Binding var selected: String
    var options: [String] = [
    "Ghana Card",
    "Passport Number",
    "Driver License Number"
    ]
    
    var body: some View {
        VStack (){
            HStack {
                Spacer()
                
                Button("Close"){ withAnimation { show.toggle() }}
                    .font(.headline)
                    .foregroundStyle(.red)
            }
            .padding()
            
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(options, id:\.self) { option in
                        Button {selected = option;  show.toggle()} label: {
                            HStack {
                                Text(option)
                                    .font(.title3)
                                    .foregroundStyle(scheme == .dark ? .white : .black)
                                    .padding(.vertical, 13)
                                    .padding(.leading, 25)
                                
                                Spacer()
                                
                                if selected == option {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(scheme == .dark ? .white : .black)
                                        .padding(.vertical, 13)
                                        .padding(.trailing, 25)
                                       
                                }
                            }
                            
                          
                        }
                        Divider().foregroundStyle(.gray).bold()
                    }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    OptionsScreen(show: .constant(false), selected: .constant("Ghana Card"))
}
