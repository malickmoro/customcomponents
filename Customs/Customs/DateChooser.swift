//
//  Test.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct DateChooser: View {
    @Binding var dateRaw: Date
    @Binding var trigger: Bool
    @Environment (\.colorScheme) var scheme

    var body: some View {
        VStack(alignment: .center) {

            
            Divider().bold()
            HStack {
                Button("Clear") {dateRaw = .now}
                    .font(.title3)
                
                Spacer()
                
                Button("Done") {trigger.toggle()}
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(height: 40)
            .padding(.leading)
            .padding(.trailing)
            .background(scheme == .dark ? .black : .white)
            
            
            DatePicker("", selection: $dateRaw, in: ...Date(), displayedComponents: .date)
                .datePickerStyle(.wheel)
                .padding(.trailing, 25)
        }
    }
}

#Preview {
    DateChooser(dateRaw: .constant(.now), trigger: .constant(false))
}
