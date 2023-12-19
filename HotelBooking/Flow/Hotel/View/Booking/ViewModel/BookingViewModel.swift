//
//  BookingViewModel.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI
import Combine

class BookingViewModel: ObservableObject {
    
    weak var coordinator: Coordinator<HotelRouter>?
    
    @Published var isCustomerValid: Bool?
    @Published var firstTouristIsValid: Bool?

    
    init(coordinator: Coordinator<HotelRouter>) {
        self.coordinator = coordinator
    }
    
    func payDidTap(customer: Customer, tourists: [Tourist]) {
        if customer.isValid(), // Проверка данных на валидность клиента
           let firstTourist = tourists.first,
           firstTourist.isValid()  // Проверка данных на валидность первого туриста
        {
            toReceive()
        } else {
            isCustomerValid = false
            firstTouristIsValid = false
        }
    }
    
    private func toReceive() {
        coordinator?.push(.receipt)
    }
}
