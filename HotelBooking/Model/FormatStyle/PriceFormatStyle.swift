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
        value.formatted(.number) + " " + "₽"
    }
}

extension FormatStyle where Self == PriceFormatStyle {
    static var price: PriceFormatStyle { .init() }
}
