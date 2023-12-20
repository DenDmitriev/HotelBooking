//
//  NumeralFormatStyle.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import Foundation

struct NumeralFormatStyle: FormatStyle {
    typealias FormatInput = Int
    typealias FormatOutput = String
    
    func format(_ value: Int) -> String {
        switch value {
        case  1:
            return "Первый"
        case  2:
            return "Второй"
        case  3:
            return "Третий"
        case  4:
            return "Четвертый"
        case  5:
            return "Пятый"
        case  6:
            return "Шестой"
        case  7:
            return "Седьмой"
        case  8:
            return "Восьмой"
        case  9:
            return "Девятый"
        case 10:
            return "Десятый"
        case 11:
            return "Одиннадцатый"
        case 12:
            return "Двенадцатый"
        default:
            return String(value) + "й"
        }
    }
}

extension FormatStyle where Self == PriceFormatStyle {
    static var numeral: NumeralFormatStyle { .init() }
}
