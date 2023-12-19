//
//  HotelRouter.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

enum HotelRouter: NavigationRouter {
    case rooms(hotel: String)
    
    var id: Self {
        self
    }
    
    var title: String? {
        switch self {
        case .rooms(let hotel):
            hotel
        }
    }
    
    func view() -> some View {
        switch self {
        case .rooms(let hotel):
            RoomsView(rooms: .placeholder)
        }
    }
}
