//
//  PhoneFormatStyle.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 18.12.2023.
//

import Foundation

struct PhoneFormatStyle: FormatStyle {
//    enum Mask: String {
//        case rus = "+X (XXX) XXX-XX-XX"
//    }
    
    var mask = "+X (XXX) XXX-XX-XX"
    
    func format(_ value: String) -> String {
        let numbers = value.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
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
}

extension FormatStyle where Self == PhoneFormatStyle {
    static var phone: PhoneFormatStyle { .init() }
    
//    static func phone(mask: Self.Mask) -> PhoneFormatStyle {
//        return .init(mask: mask.rawValue)
//    }
}
