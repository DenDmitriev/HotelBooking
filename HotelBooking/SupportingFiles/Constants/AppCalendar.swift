//
//  AppCalendar.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import Foundation

struct AppCalendar {
    static var calendar: Calendar = {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "ru_RU")
        calendar.timeZone = TimeZone.current
        return calendar
    }()
}
