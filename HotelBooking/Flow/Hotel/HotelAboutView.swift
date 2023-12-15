//
//  HotelAboutView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct HotelAboutView: View {
    
    let hotel: Hotel
    
    var body: some View {
        VStack(spacing: AppGrid.pt16) {
            Text("Об отеле")
                .font(AppFonts.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TagsView(tags: hotel.aboutTheHotel.peculiarities)
                .padding(-AppGrid.pt4)
            
            Text(hotel.aboutTheHotel.description)
                .padding(.top, -AppGrid.pt4)
                .font(AppFonts.regular)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HotelServicesView()
            
        }
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt12)
    }
}

#Preview {
    HotelAboutView(hotel: .placeholder)
}
