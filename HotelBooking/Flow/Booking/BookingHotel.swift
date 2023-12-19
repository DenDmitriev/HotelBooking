//
//  HotelThumbCompact.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct BookingHotel: View {
    
    let booking: Booking
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppGrid.pt8) {
            HotelBudge(rating: booking.horating, ratingName: booking.ratingName)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(booking.hotelName)
                .font(AppFonts.title2)
            
            Button(booking.hotelAdress) {
                print("Go to map view")
            }
            .foregroundStyle(.accent)
            .font(AppFonts.caption1)
            .disabled(true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt15)
    }
}

#Preview {
    BookingHotel(booking: .placeholder)
}
