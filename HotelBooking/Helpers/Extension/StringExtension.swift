//
//  StringExtension.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import Foundation

extension String {
    var isName: Bool {
        2...99 ~= self.count
    }
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self)
    }
    
    var isPhone: Bool {
        guard self.count == 12 else { return false }
        let character = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: character)
        let filtered = inputString.joined(separator: "")
        return self == filtered
    }
    
    var isPassport: Bool {
        let passportRegEx = "^(?!^0+$)[a-zA-Z0-9]{3,20}$"
        let passportPredicate = NSPredicate(format:"SELF MATCHES %@", self)
        
        return passportPredicate.evaluate(with: self)
      }
}
