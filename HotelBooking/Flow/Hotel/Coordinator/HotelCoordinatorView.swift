//
//  HotelCoordinator.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

struct HotelCoordinatorView: View {
    
    @StateObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.hotel, coordinator: coordinator)
                .navigationTitle(HotelRouter.hotel.title)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: HotelRouter.self) { route in
                    coordinator.build(route, coordinator: coordinator)
                }
                .alert(isPresented: $coordinator.hasError, error: coordinator.error ?? AppError.unknown) {
                    Button("OK") { }
                }
        }
        .accentColor(.primary)
        .environmentObject(coordinator)
    }
}

#Preview("HotelCoordinator") {
    HotelCoordinatorView(coordinator: AppCoordinator())
}
