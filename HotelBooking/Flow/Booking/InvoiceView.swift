//
//  InvoiceView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import SwiftUI

struct InvoiceView: View {
    
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
    let totalPrice: Int
    
    var body: some View {
        VStack(spacing: AppGrid.pt16) {
            row(title: "Тур", value: tourPrice)
            row(title: "Топливный сбор", value: fuelCharge)
            row(title: "Сервисный сбор", value: serviceCharge)
            row(title: "К оплате", value: totalPrice, font: AppFonts.title3, color: .accent)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt15)
    }
    
    private func row(title: String, value: Int, font: Font = AppFonts.regular, color: Color = .primary) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(AppColors.grayOne)
                .font(AppFonts.regular)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(value.formatted(.price))
                .foregroundStyle(color)
                .font(font)
        }
    }
}

#Preview {
    let booking: Booking = .placeholder
    return InvoiceView(tourPrice: booking.tourPrice, fuelCharge: booking.fuelCharge, serviceCharge: booking.serviceCharge, totalPrice: booking.totalPrice())
}
