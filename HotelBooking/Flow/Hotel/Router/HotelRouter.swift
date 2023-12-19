//
//  HotelRouter.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

enum HotelRouter: NavigationRouter {
    case hotel
    case rooms(hotel: Hotel)
    case booking(room: Room)
    case receipt
    
    var id: Self {
        self
    }
    
    var title: String {
        switch self {
        case .hotel:
            "Отель"
        case .rooms(let hotel):
            hotel.name
        case .booking:
            "Бронирование"
        case .receipt:
            "Заказ оплачен"
        }
    }
    
    func view(coordinator: Coordinator<HotelRouter>) -> some View {
        switch self {
        case .hotel:
            HotelView(viewModel: HotelViewModel(coordinator: coordinator), hotel: .placeholder)
        case .rooms(let hotel):
            RoomsView(rooms: .placeholder, hotelName: hotel.name)
        case .booking:
            BookingView(booking: .placeholder, viewModel: BookingViewModel(coordinator: coordinator))
        case .receipt:
            ReceiptView()
        }
    }
}
