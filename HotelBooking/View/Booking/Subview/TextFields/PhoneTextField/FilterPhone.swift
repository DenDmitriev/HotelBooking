//
//  FilterNumberPhone.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//


import SwiftUI

class FilterPhone: ObservableObject {
    
    static func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for character in mask where index < numbers.endIndex {
            if character == "X" {
                if numbers.count == 1 && numbers != "7" {
                    result.append("7")
                    result.append(numbers[index])
                    index = numbers.index(after: index)
                } else {
                    result.append(numbers[index])
                    index = numbers.index(after: index)
                }
            } else {
                result.append(character)
            }
        }
        return result
    }
    
    static func format(phone: String) -> String {
        let numbers = "+" + phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        return numbers
    }
}
