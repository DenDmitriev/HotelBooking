//
//  HotelCoordinator.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

struct HotelCoordinator: View {
    
    @StateObject var coordinator: Coordinator<HotelRouter>
    
    @State var hotelViewModel: HotelViewModel?
    @State var bookingViewModel: BookingViewModel?
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.hotel, coordinator: coordinator)
                .navigationTitle(HotelRouter.hotel.title)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: HotelRouter.self) { route in
                    coordinator.build(route, coordinator: coordinator)
                }
        }
        .accentColor(.primary)
        .environmentObject(coordinator)
    }
    
    func viewModelBuilder(route: HotelRouter) -> (any ObservableObject)? {
        switch route {
        case .hotel:
            if hotelViewModel == nil {
                hotelViewModel = HotelViewModel(coordinator: coordinator)
            }
            return hotelViewModel
        case .rooms:
            return nil
        case .booking:
            if bookingViewModel == nil {
                bookingViewModel = BookingViewModel(coordinator: coordinator)
            }
            return bookingViewModel
        case .receipt:
            return nil
        }
    }
}

#Preview("HotelCoordinator") {
    HotelCoordinator(coordinator: Coordinator<HotelRouter>())
}
