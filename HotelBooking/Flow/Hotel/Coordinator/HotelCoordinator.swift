//
//  HotelCoordinator.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

struct HotelCoordinator: View {
    
    @StateObject var coordinator: Coordinator<HotelRouter>
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.hotel)
                .navigationTitle(HotelRouter.hotel.title)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: HotelRouter.self) { route in
                    coordinator.build(route)
                }
        }
        .accentColor(.primary)
        .environmentObject(coordinator)
    }
}

#Preview("HotelCoordinator") {
    HotelCoordinator(coordinator: Coordinator<HotelRouter>())
}
