//
//  RoomsView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct RoomsView: View {
    @State var rooms: [Room] = []
    @State var hotelName: String
    @StateObject var viewModel: RoomsViewModel
    
    var body: some View {
        Group {
            if !rooms.isEmpty {
                ScrollView {
                    
                    LazyVStack {
                        ForEach(rooms) { room in
                            RoomView(room: room)
                        }
                    }
                    .padding(.vertical, AppGrid.pt8)
                    .background(AppColors.backgroundList)
                    
                }
            } else {
                Placeholder(style: .loading(text: "Загрузка комнат"))
            }
        }
        .navigationTitle(hotelName)
        .onAppear {
            Task {
                await viewModel.getRooms()
            }
        }
        .onReceive(viewModel.$rooms) { rooms in
            self.rooms = rooms
        }
    }
}

#Preview {
    NavigationStack {
        RoomsView(rooms: .placeholder, hotelName: Hotel.placeholder.name, viewModel: RoomsViewModel(coordinator: AppCoordinator()))
            .navigationBarTitleDisplayMode(.inline)
    }
}
