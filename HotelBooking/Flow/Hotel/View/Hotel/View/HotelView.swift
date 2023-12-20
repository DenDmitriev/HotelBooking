//
//  HotelView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import SwiftUI

struct HotelView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject var viewModel: HotelViewModel
    @State var hotel: Hotel?
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Environment(\.dismiss) private var dismiss
    @State private var bottomSize: CGSize = .zero
    
    var body: some View {
        Group {
            if let hotel {
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
                        WrapperButton(text: "К выбору номера") {
                            coordinator.push(.rooms(hotel: hotel))
                        }
                        .padding(.top, AppGrid.pt16)
                    }
                }
            } else {
                Placeholder(style: .loading(text: "Загрузка отеля"))
            }
        }
        .onAppear {
            Task {
                await viewModel.getHotel()
            }
        }
        .onReceive(viewModel.$hotel) { hotel in
            self.hotel = hotel
        }
    }
}

#Preview("HotelView") {
    NavigationStack {
        HotelView(viewModel: HotelViewModel(coordinator: AppCoordinator()), hotel: .placeholder)
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
    }
    .environmentObject(AppCoordinator())
}
