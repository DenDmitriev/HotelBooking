//
//  HotelBudge.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import SwiftUI

struct HotelBudge: View {
    
    let rating: Int
    let ratingName: String
    
    var body: some View {
        HStack(spacing: AppGrid.pt2) {
            Image(systemName: "star.fill")
            Text(rating.formatted())
            Text(ratingName)
        }
        .padding(AppGrid.pt10)
        .foregroundColor(AppColors.gold)
        .background(AppColors.gold.opacity(0.2))
        .cornerRadius(AppGrid.pt5)
        .font(AppFonts.headline2)
    }
}

#Preview {
    HotelBudge(rating: Hotel.placeholder.rating, ratingName: Hotel.placeholder.ratingName)
}
