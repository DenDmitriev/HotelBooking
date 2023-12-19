//
//  TagView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct TagItem: View {
    @State var text: String
    var body: some View {
        Text(text)
            .lineLimit(1)
            .font(AppFonts.headline2)
            .foregroundStyle(AppColors.grayOne)
            .padding(.vertical, AppGrid.pt5)
            .padding(.horizontal, AppGrid.pt10)
            .background(AppColors.backgroundTag)
            .cornerRadius(AppGrid.pt5)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TagItem(text: Hotel.placeholder.aboutTheHotel.peculiarities.first ?? "3-я линия")
}
