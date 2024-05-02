//
//  DateExtension.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import Foundation

extension Date {
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    

    func format(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
