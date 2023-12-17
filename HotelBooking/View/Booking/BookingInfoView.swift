//
//  BookingInfoView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct BookingInfoView: View {
    
    let booking: Booking
    
    private let columns = [
        GridItem(.fixed(AppGrid.pt124)),
        GridItem(.flexible(minimum: AppGrid.pt124))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: AppGrid.pt16, content: {
            key(text: "Вылет из")
            value(text: booking.departure)
            
            key(text: "Страна, город")
            value(text: booking.arrivalCountry)
            
            key(text: "Даты")
            valueDates(start: booking.tourDateStart, end: booking.tourDateStop)
            
            key(text: "Кол-во ночей")
            value(text: booking.numberOfNights.formatted())
            
            key(text: "Отель")
            value(text: booking.hotelName)
            
            key(text: "Номер")
            value(text: booking.room)
            
            key(text: "Питание")
            value(text: booking.nutrition)
        })
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt15)
    }
    
    func key(text: String) -> some View {
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
    BookingInfoView(booking: .placeholder)
}
