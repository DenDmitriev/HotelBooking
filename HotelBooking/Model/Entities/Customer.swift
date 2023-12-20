//
//  Customer.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import Foundation

struct Customer {
    var phone: String = ""
    var email: String = ""
    
    func isValid() -> Bool {
        var validationable: [Bool] = []
        validationable.append(phone.isPhone)
        validationable.append(email.isEmail)
        
        return validationable.compactMap({ $0 == true ? nil : true }).isEmpty
    }
}
