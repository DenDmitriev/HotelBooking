//
//  HotelViewModel.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

class HotelViewModel: ObservableObject {
    
    weak var coordinator: Coordinator<HotelRouter>?
    
    init(coordinator: Coordinator<HotelRouter>) {
        self.coordinator = coordinator
    }
    
    func fetchRooms() {
        
    }
}
