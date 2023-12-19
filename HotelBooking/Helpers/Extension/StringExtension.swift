//
//  StringExtension.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import Foundation

extension String {
    
    /// Person's name (first, last, or both) in any letter case. Although not perfect,
    /// this expression will filter out many incorrect name formats (especially numerics and invalid special characters).
    var isPersonName: Bool {
        let personNameRexEx = "^[a-zA-Z]+(([\'\\,\\.\\- ][a-zA-Z ])?[a-zA-Z]*)*$"
        let personNamePredicate = NSPredicate(format:"SELF MATCHES %@", personNameRexEx)
        return personNamePredicate.evaluate(with: self)
    }
    
    /// Check if the text is a valid first name or last name.
    /// It allows Characters,'- and space only
    var isCharacters: Bool {
        let personNameRexEx = "^([a-zA-Z '-]+)$"
        let personNamePredicate = NSPredicate(format:"SELF MATCHES %@", personNameRexEx)
        return personNamePredicate.evaluate(with: self)
    }
    
    /// Email validation. With this short expression you can validate for proper email format. It's short and accurate.
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
    
    /// Check number of  passport.
    /// Length 3...20 symbols
    var isPassport: Bool {
        let passportRegEx = "^(?!^0+$)[a-zA-Z0-9]{3,20}$" // https://regex101.com/r/UZpfLx/1
        let passportPredicate = NSPredicate(format:"SELF MATCHES %@", passportRegEx)
        
        return passportPredicate.evaluate(with: self)
      }
}
