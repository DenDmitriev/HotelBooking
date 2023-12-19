//
//  RoomView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct RoomView: View {
    
    let room: Room
    @State var selectionImage: Int = .zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppGrid.pt16) {
            ImageSlider(imageURLs: room.imageUrls, selection: $selectionImage)
            
            Text(room.name)
                .font(AppFonts.title2)
            
            TagsView(tags: room.peculiarities)
                .padding(.vertical, -AppGrid.pt8)
            
            NavigationButtonSecond(title: "Подробнее о номере", destination: EmptyView())
                .disabled(true)
            
            PriceDescriptorView(price: room.price, descriptor: room.pricePer)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            NavigationButton(title: "Выбрать номер",
                             destination: BookingView(booking: .placeholder))
        }
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt12)
    }
}

#Preview {
    RoomView(room: Array<Room>.placeholder.first!)
}
