//
//  Customer.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import Foundation

struct Customer: Validatable {
    var phone: String = ""
    var email: String = ""
    
    func isValid() -> Bool {
        var validationable = Set<Bool>()
        validationable.insert(phone.isPhone)
        validationable.insert(email.isEmail)
        
        return validationable.isValid
    }
}
