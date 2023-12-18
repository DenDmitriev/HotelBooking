//
//  DateExtension.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 18.12.2023.
//

import Foundation

extension Date {
    /// Check the date of birth of a person who is living now
    ///
    /// We believe that a person cannot be alive today if he is older than 100 years old
    var isPersonExistingToday: Bool {
        let calendar = AppCalendar.calendar
        guard let dateStart = calendar.date(byAdding: .year, value: -100, to: .now) else { return false }
        let fromDate = calendar.startOfDay(for: dateStart)
        let toDate = calendar.startOfDay(for: .now)
        
        return fromDate...toDate ~= self
    }
    
    /// Check if your international passport is valid for a tourist flight
    ///
    /// We believe that the flight is possible if the validity period expires no earlier than in three months
    var isValidIntPassportForFlight: Bool {
        guard let minEndDatePassport = AppCalendar.calendar.date(byAdding: .month, value: 3, to: Date.now)else { return false }
        
        return self >= minEndDatePassport
    }
}
