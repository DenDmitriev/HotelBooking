//
//  HotelServiceError.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import Foundation

enum HotelServiceError: LocalizedError {
    case unknown
    case urlFailure(url: String)
    case responseFailure
    case map(description: String)
    
    var errorDescription: String? {
        switch self {
        case .unknown:
            return String(localized: "Unknown error", comment: "Error")
        case .urlFailure:
            return String(localized: "URL error", comment: "Error")
        case .responseFailure:
            return String(localized: "Response failure", comment: "Error")
        case .map(let description):
            return description
        }
    }
}
