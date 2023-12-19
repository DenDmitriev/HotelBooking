//
//  Service.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import Foundation

struct Service {
    let type: ServiceType
    let utility: String = "Самое необходимое"
}

extension Service: Identifiable, Hashable {
    var id: Int {
        type.rawValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Service {
    enum ServiceType: Int, CaseIterable {
        case facilities
        case included
        case notIncluded
        
        var title: String {
            switch self {
            case .facilities:
                return "Удобства"
            case .included:
                return "Что включено"
            case .notIncluded:
                return "Что не включено"
            }
        }
        
        var image: String {
            switch self {
            case .facilities:
                return "emoji-happy"
            case .included:
                return "tick-square"
            case .notIncluded:
                return "close-square"
            }
        }
    }
}

