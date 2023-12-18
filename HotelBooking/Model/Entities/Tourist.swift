//
//  Tourist.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import Foundation

struct Tourist: Validatable {
    let id: Int
    var name: String = ""
    var surname: String = ""
    var dateOfBirth: Date = .now
    var citizenship: String = ""
    var intPassport: String = ""
    var intPassportEndDate: Date = .now
    
    func isValid() -> Bool {
        var validationable = Set<Bool>()
        validationable.insert(name.isName)
        validationable.insert(surname.isName)
        validationable.insert(dateOfBirth < Date.now)
        validationable.insert(0...99 ~= citizenship.count)
        validationable.insert(intPassport.isPassport)
        validationable.insert(intPassportEndDate > AppCalendar.calendar.date(byAdding: .month, value: 3, to: .now) ?? .now)
        
        return validationable.isValid
    }
}

extension Array<Tourist> {
    var isValids: Self {
        self.filter({ $0.isValid() })
    }
}
