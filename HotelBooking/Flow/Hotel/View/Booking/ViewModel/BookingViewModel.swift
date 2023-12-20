//
//  BookingViewModel.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI
import Combine

class BookingViewModel: ObservableObject {
    weak var coordinator: AppCoordinator?
    
    @Published var booking: Booking?
    @Published var isCustomerValid: Bool?
    @Published var firstTouristIsValid: Bool?

    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func getBooking() async {
        let bookingResult = await HotelService.getBooking()
        switch bookingResult {
        case .success(let booking):
            update(booking: booking)
        case .failure(let failure):
            showError(error: failure as? LocalizedError)
        }
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
    
    private func update(booking: Booking) {
        DispatchQueue.main.async {
            self.booking = booking
        }
    }
    
    private func showError(error: LocalizedError?) {
        DispatchQueue.main.async {
            self.coordinator?.presentAlert(error: AppError.map(error: error))
        }
    }
    
    private func toReceive() {
        coordinator?.push(.receipt)
    }
}
