//
//  ScreenSizePreferenceKey.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 18.12.2023.
//

import SwiftUI

struct ScreenSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
