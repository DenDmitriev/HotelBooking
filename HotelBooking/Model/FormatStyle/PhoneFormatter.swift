//
//  PhoneFormatter.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 18.12.2023.
//

import Foundation

class PhoneFormatter: Formatter {
    override func string(for obj: Any?) -> String? {
        guard let text = obj, let text = text as? String else { return nil }
        return text.formatted(.phone)
    }

    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        print("in getObjectValue(), string = \(string)")
        obj?.pointee = string.formatted(.phone) as AnyObject
        return true
    }
    
    static func unformatted(_ value: String) -> String {
        return value.replacingOccurrences(of: "[^+0-9]", with: "", options: .regularExpression)
    }
}

extension Formatter {
    static var phone: PhoneFormatter { .init() }
}
