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
        NavigationStack {
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
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationButton(
                        title: "К выбору номера",
                        destination: RoomsView(rooms: .placeholder)
                            .navigationTitle(
                                Text(hotel.name)
                            )
                    )
                    .padding(.top, AppGrid.pt16)
                }
            }
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.primary)
    }
}

#Preview("HotelView") {
    HotelView(hotel: .placeholder)
}
