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
//            Text("Отель")
//                .font(AppFonts.headline1)
            
            HotelImageSlider(imageURLs: hotel.imageUrls, selection: $selectionImage)
            
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
            
            HStack(alignment: .firstTextBaseline) {
                Text("от " + hotel.minimalPrice.formatted(.price))
                    .font(AppFonts.title1)
                
                Text(hotel.priceForIt.lowercased())
                    .font(AppFonts.regular)
                    .foregroundStyle(AppColors.grayOne)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
//        .padding(.top, safeAreaInsets.top)
//        .padding(.top, -AppGrid.pt8)
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt12)
    }
}

#Preview {
    HotelThumbView(hotel: .placeholder)
}
