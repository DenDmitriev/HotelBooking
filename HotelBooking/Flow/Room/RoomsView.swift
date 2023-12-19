//
//  RoomsView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct RoomsView: View {
    
    let rooms: [Room]
    @State var hotelName: String
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(rooms) { room in
                    RoomView(room: room)
                }
            }
            .padding(.vertical, AppGrid.pt8)
            .background(AppColors.backgroundList)
        }
        .navigationTitle(hotelName)
    }
}

#Preview {
    NavigationStack {
        RoomsView(rooms: .placeholder, hotelName: Hotel.placeholder.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}
