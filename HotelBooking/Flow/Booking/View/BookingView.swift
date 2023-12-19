//
//  BookingView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    let booking: Booking
    
    @EnvironmentObject var coordinator: Coordinator<HotelRouter>
    @StateObject var viewModel: BookingViewModel
    
    @State var customer: Customer = .init()
    @State var tourists: [Tourist] = [Tourist(id: 0)]
    @State private var touristCount: Int = 1
    
    var body: some View {
        ScrollViewReader { scrollReader in
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
        }
        .keyboardAvoiding(offset: AppGrid.pt32)
        .toolbar(content: {
            ToolbarItem(placement: .bottomBar) {
                WrapperButton(text: "Оплатить \(booking.totalPrice().formatted(.price))") {
                    viewModel.payDidTap(customer: customer, tourists: tourists)
                }
                .padding(.top, AppGrid.pt16)
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
    let coordinator = Coordinator<HotelRouter>()
    return NavigationStack {
        BookingView(booking: .placeholder, viewModel: BookingViewModel(coordinator: coordinator))
            .environmentObject(coordinator)
    }
}
