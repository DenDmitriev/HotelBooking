//
//  SetBool?Extension.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import Foundation

extension Array<Bool?> {
    var isValid: Bool {
        let failValidates = self.compactMap {
            ($0 ?? false) == true ? nil : $0
        }
        let isValid = failValidates.isEmpty

        return isValid
    }
}
