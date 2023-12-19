//
//  BookingInfoView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct BookingInfo: View {
    
    let booking: Booking
    
    private let columns = [
        GridItem(.fixed(AppGrid.pt124)),
        GridItem(.flexible(minimum: AppGrid.pt124))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: AppGrid.pt16, content: {
            title(text: "Вылет из")
            value(text: booking.departure)
            
            title(text: "Страна, город")
            value(text: booking.arrivalCountry)
            
            title(text: "Даты")
            valueDates(start: booking.tourDateStart, end: booking.tourDateStop)
            
            title(text: "Кол-во ночей")
            value(text: booking.numberOfNights.formatted())
            
            title(text: "Отель")
            value(text: booking.hotelName)
            
            title(text: "Номер")
            value(text: booking.room)
            
            title(text: "Питание")
            value(text: booking.nutrition)
        })
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt15)
    }
    
    func title(text: String) -> some View {
        Text(text)
            .font(AppFonts.regular)
            .foregroundStyle(AppColors.grayOne)
    }
    
    func value(text: String) -> some View {
        Text(text)
            .font(AppFonts.regular)
            .foregroundStyle(.primary)
    }
    
    func valueDates(start: Date, end: Date) -> some View {
        let dateFormatter = AppFormatter.dateFormatter
        let from = dateFormatter.string(from: start)
        let to = dateFormatter.string(from: end)
        return Text(from + " – " + to)
    }
}

#Preview {
    BookingInfo(booking: .placeholder)
}
