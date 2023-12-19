//
//  BookingView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    let booking: Booking
    @State var customer: Customer = .init()
    @State var tourists: [Tourist] = [Tourist(id: 0)]
    
    @State private var isCustomerValid: Bool?
    
    @State private var touristCount: Int = 1
    @State private var firstTouristISValid: Bool = false
    
    @State private var isAllValid: Bool = false
    
    private var validationables: Set<Bool?> {
        [isCustomerValid, firstTouristISValid]
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: AppGrid.pt8) {
                BookingHotel(booking: booking)
                
                BookingInfo(booking: booking)
                
                CustomerForm(customer: $customer, isValid: $isCustomerValid)
                
                LazyVStack {
                    ForEach(0...tourists.index(before: touristCount), id: \.self) { index in
                        TouristForm(
                            tourist: touristWrapper(tourist: tourists.first(where: { $0.id == index }) ?? Tourist(id: index)),
                            isValid: index == 0 ? $firstTouristISValid : .constant(true),
                            number: index
                        )
                    }
                }
                
                AddTouristView(touristCount: $touristCount)
                
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
        .keyboardAvoiding(offset: AppGrid.pt32)
        .toolbar(content: {
            ToolbarItem(placement: .bottomBar) {
                NavigationButton(
                    title: "Оплатить \(booking.totalPrice().formatted(.price))",
                    destination: ReceiptView()) {
                        print("Pay did tap")
                        print("---Customer---")
                        print("👨‍💻", customer.isValid() ? customer : "customer not valid")
                        print("---Tourists---")
                        print("🧳", tourists.isValids)
                    }
                    .disabled(!isAllValid)
                    .padding(.top, AppGrid.pt16)
                    .onChange(of: validationables) {
                        isAllValid = validationables.isValid
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
                    print(tourists[index] )
                } else {
                    tourists.append(tourist)
                }
            }
        )
    }
}

#Preview {
    BookingView(booking: .placeholder)
}
