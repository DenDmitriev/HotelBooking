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
                
                
                NavigationButton(title: "К выбору номера", destination: EmptyView())
                    .padding(AppGrid.pt16)
                    .background(.background)
                    .border(width: AppGrid.pt1, edges: [.top], color: AppColors.seporator)
            }
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview("HotelView") {
    HotelView(hotel: .placeholder)
}
