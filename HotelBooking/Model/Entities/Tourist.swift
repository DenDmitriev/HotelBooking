//
//  Tourist.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import Foundation

struct Tourist: Identifiable {
    let id: Int
    var name: String = ""
    var surname: String = ""
    var dateOfBirth: Date = .now
    var citizenship: String = ""
    var intPassport: String = ""
    var intPassportEndDate: Date = .now
    
    func isValid() -> Bool {
        var validationable: [Bool] = []
        validationable.append(name.isPersonName)
        validationable.append(surname.isPersonName)
        validationable.append(dateOfBirth < Date.now)
        validationable.append(citizenship.isCharacters)
        validationable.append(intPassport.isPassport)
        validationable.append(intPassportEndDate > AppCalendar.calendar.date(byAdding: .month, value: 3, to: .now) ?? .now)
        
        return validationable.compactMap({ $0 == true ? nil : true }).isEmpty
    }
}

