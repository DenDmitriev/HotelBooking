//
//  HotelThumbView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import SwiftUI

struct HotelThumbView: View {
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    let hotel: Hotel
    @State private var selectionImage: Int = .zero
    
    var body: some View {
        VStack(spacing: AppGrid.pt16) {
            ImageSlider(imageURLs: hotel.imageUrls, selection: $selectionImage)
            
            HotelBudge(rating: hotel.rating, ratingName: hotel.ratingName)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: AppGrid.pt10) {
                Text(hotel.name)
                    .font(AppFonts.title2)
                
                Button(hotel.adress) {
                    print("Go to map view")
                }
                .foregroundStyle(.accent)
                .font(AppFonts.caption1)
                .disabled(true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            PriceDescriptorView(price: hotel.minimalPrice, descriptor: hotel.priceForIt, rule: .from)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt12)
    }
}

#Preview {
    HotelThumbView(hotel: .placeholder)
}
