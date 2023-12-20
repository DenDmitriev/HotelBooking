//
//  BookingView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    @State var booking: Booking?
    
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject var viewModel: BookingViewModel
    
    @State var customer: Customer = .init()
    @State var tourists: [Tourist] = [Tourist(id: 0)]
    @State private var touristCount: Int = 1
    
    var body: some View {
        ScrollViewReader { scrollReader in
            if let booking {
                ScrollView {
                    LazyVStack(spacing: AppGrid.pt8) {
                        BookingHotel(booking: booking)
                        
                        BookingInfo(booking: booking)
                        
                        CustomerForm(customer: $customer, isValid: $viewModel.isCustomerValid)
                        
                        VStack {
                            ForEach(tourists) { tourist in
                                let isFirstTourist = tourist.id == 0
                                TouristForm(
                                    tourist: touristWrapper(tourist: tourist),
                                    isValid: isFirstTourist ? $viewModel.firstTouristIsValid : .constant(nil)
                                )
                                .id(tourist.id)
                            }
                        }
                        
                        AddTouristView(tourists: $tourists, touristCount: $touristCount)
                            .onChange(of: touristCount) {
                                if let tourist = tourists.last {
                                    withAnimation {
                                        scrollReader.scrollTo(tourist.id, anchor: .top)
                                    }
                                }
                            }
                        
                        InvoiceView(
                            tourPrice: booking.tourPrice,
                            fuelCharge: booking.fuelCharge,
                            serviceCharge: booking.serviceCharge,
                            totalPrice: booking.totalPrice()
                        )
                    }
                    .padding(.vertical, AppGrid.pt8)
                    .background(AppColors.backgroundList)
                }
            } else {
                Placeholder(style: .loading(text: "Загрузка бронирования"))
            }
        }
        .keyboardAvoiding(offset: AppGrid.pt32)
        .onAppear {
            Task {
                await viewModel.getBooking()
            }
        }
        .onReceive(viewModel.$booking) { booking in
            self.booking = booking
        }
        .toolbar(content: {
            if let booking {
                ToolbarItem(placement: .bottomBar) {
                    WrapperButton(text: "Оплатить \(booking.totalPrice().formatted(.price))") {
                        viewModel.payDidTap(customer: customer, tourists: tourists)
                    }
                    .padding(.top, AppGrid.pt16)
                }
            }
        })
        .navigationTitle("Бронирование")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func touristWrapper(tourist: Tourist) -> Binding<Tourist> {
        Binding<Tourist>(
            get: { tourist },
            set: { tourist in
                if let index = tourists.firstIndex(where: { $0.id == tourist.id }) {
                    tourists[index] = tourist
                } else {
                    tourists.append(tourist)
                }
            }
        )
    }
}

#Preview {
    let coordinator = AppCoordinator()
    return NavigationStack {
        BookingView(booking: .placeholder, viewModel: BookingViewModel(coordinator: coordinator))
            .environmentObject(coordinator)
    }
}
