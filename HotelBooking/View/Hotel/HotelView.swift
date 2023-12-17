//
//  HotelView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import SwiftUI

struct HotelView: View {
    
    let hotel: Hotel
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Environment(\.dismiss) private var dismiss
    @State private var bottomSize: CGSize = .zero
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: AppGrid.pt8) {
                        HotelThumbView(hotel: hotel)
                            .offset(y: -AppGrid.pt8)
                            .padding(.bottom, -AppGrid.pt8)
                        
                        HotelAboutView(hotel: hotel)
                            .padding(.bottom, bottomSize.height)
                    }
                    .padding(.bottom, AppGrid.pt8)
                    .background(AppColors.backgroundList)
                }
                
                NavigationButton(
                    title: "К выбору номера",
                    destination: RoomsView(rooms: .placeholder)
                        .navigationTitle(
                            Text(hotel.name)
                        )
                )
                .padding(AppGrid.pt16)
                .background(.background)
                .border(width: AppGrid.pt1, edges: [.top], color: AppColors.seporator)
                .padding(.bottom, AppGrid.pt12)
                .readSize { size in
                    bottomSize = size
                }
            }
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
        }
        .accentColor(.primary)
    }
}

#Preview("HotelView") {
    HotelView(hotel: .placeholder)
}
