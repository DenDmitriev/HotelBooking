//
//  RoomsViewModel.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import Foundation

class RoomsViewModel: ObservableObject {
    weak var coordinator: AppCoordinator?
    
    @Published var rooms: [Room] = []
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func getRooms() async {
        let roomsResult = await HotelService.getRooms()
        switch roomsResult {
        case .success(let rooms):
            update(rooms: rooms)
        case .failure(let failure):
            showError(error: failure as? LocalizedError)
        }
    }
    
    private func update(rooms: [Room]) {
        DispatchQueue.main.async {
            self.rooms = rooms
        }
    }
    
    private func showError(error: LocalizedError?) {
        DispatchQueue.main.async {
            self.coordinator?.presentAlert(error: AppError.map(error: error))
        }
    }
}
