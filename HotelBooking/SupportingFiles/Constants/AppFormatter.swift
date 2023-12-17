//
//  AppFormatter.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import Foundation

struct AppFormatter {
    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "RU-ru")
        dateFormatter.dateFormat = "dd.MM.YYYY"
        return dateFormatter
    }()
    
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "RU-ru")
        formatter.maximumFractionDigits = .zero
        formatter.numberStyle = .currency
        return formatter
    }()
}
