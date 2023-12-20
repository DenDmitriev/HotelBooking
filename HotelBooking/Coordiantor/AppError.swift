//
//  AppError.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 20.12.2023.
//

import Foundation

enum AppError: LocalizedError {
    case unknown
    case map(error: LocalizedError?)
    
    var errorDescription: String? {
        switch self {
        case .unknown:
            return String(localized: "Неизвестная ошибка", comment: "Error")
        case .map(let error):
            return error?.localizedDescription
        }
    }
}
