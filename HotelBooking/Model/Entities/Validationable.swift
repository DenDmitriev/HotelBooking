//
//  Validatable.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import SwiftUI

class Validationables: ObservableObject, Equatable {
    var id: UUID = UUID()
    
    @Published var validates = Set<Validationable>()
    
    var isValid: Bool {
        let failValidates = validates.compactMap {
            ($0.result ?? false) == true ? nil : $0
        }
        let isValid = failValidates.isEmpty
        if !isValid {
            failValidates.forEach { validationable in
                print("Fail validationable:", validationable.description)
            }
        }
        return isValid
    }
    
    func insert(_ validate: Validationable) {
        validates.insert(validate)
    }
    
    static func == (lhs: Validationables, rhs: Validationables) -> Bool {
        lhs.id == rhs.id
    }
}

struct Validationable: Hashable, CustomStringConvertible {
    
    let name: String
    @Binding var result: Bool?
    
    var description: String {
        return name + " is " + (result?.description ?? "nil")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Validationable, rhs: Validationable) -> Bool {
        lhs.name == rhs.name
    }
}
