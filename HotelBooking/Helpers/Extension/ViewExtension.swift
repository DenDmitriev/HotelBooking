//
//  ViewExtension.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 20.12.2023.
//

import SwiftUI

// MARK: - Hide Keyboard
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
