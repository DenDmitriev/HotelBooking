//
//  SetBool?Extension.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import Foundation

extension Set<Bool?> {
    var isValid: Bool {
        let failValidates = self.compactMap {
            $0 ?? false == true ? nil : false
        }
        return failValidates.isEmpty
    }
}

extension Set<Bool> {
    var isValid: Bool {
        let failValidates = self.compactMap {
            $0 == true ? nil : false
        }
        return failValidates.isEmpty
    }
}
