//
//  Tourist.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import Foundation

struct Tourist {
    let id: Int
    var name: String = ""
    var surname: String = ""
    var dateOfBirth: Date = .now
    var citizenship: String = ""
    var internationalPassport: String = ""
    var internationalPassportEndDate: Date = .now
    
    func isValid() -> Bool {
        var validationable = Set<Bool>()
        validationable.insert(name.isName)
        validationable.insert(surname.isName)
        validationable.insert(dateOfBirth < Date.now)
        validationable.insert(0...99 ~= citizenship.count)
        validationable.insert(internationalPassport.isPassport)
        validationable.insert(internationalPassportEndDate > AppCalendar.calendar.date(byAdding: .month, value: 3, to: .now) ?? .now)
        
        return validationable.isValid
    }
}
