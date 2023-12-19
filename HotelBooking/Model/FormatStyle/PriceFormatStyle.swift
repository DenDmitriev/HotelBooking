//
//  PriceFormatStyle.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import Foundation

struct PriceFormatStyle: FormatStyle {
    typealias FormatInput = Int
    typealias FormatOutput = String
    
    func format(_ value: Int) -> String {
        guard let formatted = AppFormatter.currencyFormatter.string(from: value as NSNumber)
        else { return "\(value.formatted(.number)) ₽" }
        
        return formatted
    }
}

extension FormatStyle where Self == PriceFormatStyle {
    static var price: PriceFormatStyle { .init() }
}
