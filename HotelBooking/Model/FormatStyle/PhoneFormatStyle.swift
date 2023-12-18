//
//  PhoneFormatStyle.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 18.12.2023.
//

import Foundation

struct PhoneFormatStyle: FormatStyle {
    enum Mask: String, Codable {
        case ru = "+* (***) ***-**-**"
        
        var pattern: String {
            self.rawValue
        }
        
        var code: String {
            switch self {
            case .ru:
                return "7"
            }
        }
    }
    
    var mask: Mask = Mask.ru
    
    func format(_ value: String) -> String {
        let numbers = value.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for character in mask.pattern where index < numbers.endIndex {
            if character == "*" {
                if numbers.count == 1 && numbers != mask.code {
                    result.append(mask.code)
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
    
    static func phone(mask: Self.Mask) -> PhoneFormatStyle {
        return .init(mask: mask)
    }
}
