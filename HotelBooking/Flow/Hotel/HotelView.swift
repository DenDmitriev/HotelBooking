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
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: AppGrid.pt8) {
                        HotelThumbView(hotel: hotel)
                            .offset(y: -AppGrid.pt8)
                            .padding(.bottom, -AppGrid.pt8)
                        
                        HotelAboutView(hotel: hotel)
                        
                        Spacer()
                            .frame(height: AppGrid.pt64)
                    }
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
            }
            .navigationTitle(
                Text("Отель")
            )
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "chevron.left")
//                            .padding(.leading, AppGrid.pt8)
//                            .fontWeight(.medium)
//                    }
//                }
//            }
        }
        .accentColor(.primary)
    }
}

#Preview("HotelView") {
    HotelView(hotel: .placeholder)
}
