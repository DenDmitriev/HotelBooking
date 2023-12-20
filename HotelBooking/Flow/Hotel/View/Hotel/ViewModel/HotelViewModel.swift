//
//  HotelViewModel.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

class HotelViewModel: ObservableObject {
    
    weak var coordinator: AppCoordinator?
    
    @Published var hotel: Hotel?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func getHotel() async {
        let hotelResult = await HotelService.getHotel()
        switch hotelResult {
        case .success(let hotel):
            update(hotel: hotel)
        case .failure(let failure):
            showError(error: failure as? LocalizedError)
        }
    }
    
    private func update(hotel: Hotel) {
        DispatchQueue.main.async {
            self.hotel = hotel
        }
    }
    
    private func showError(error: LocalizedError?) {
        DispatchQueue.main.async {
            self.coordinator?.presentAlert(error: AppError.map(error: error))
        }
    }
}
