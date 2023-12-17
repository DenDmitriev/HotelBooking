//
//  BookingView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    let booking: Booking
    @State var customer: Customer? = nil
    @State var tourists: [Tourist] = []
    
    @State private var email: String = ""
    @State private var isEmailValid: Bool?
    
    @State private var phone: String = ""
    @State private var isEmailPhone: Bool?
    
    @State private var touristCount: Int = 1
    @State private var firstTouristISValid: Bool = false
    
    @State private var isAllValid: Bool = false
    
    @State private var bottomSize: CGSize = .zero
    
    private var validationables: Set<Bool?> {
        [isEmailValid, isEmailPhone, firstTouristISValid]
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                LazyVStack(spacing: AppGrid.pt8) {
                    BookingHotel(booking: booking)
                    
                    BookingInfoView(booking: booking)
                    
                    CustomerPersonalInfoView(
                        email: $email, isEmailValid: $isEmailValid,
                        phone: $phone, isPhoneValid: $isEmailPhone
                    )
                    
                    LazyVStack {
                        ForEach(1...touristCount, id: \.self) { index in
                            TouristView(
                                tourist: touristWrapper(id: index),
                                isAllValid: index == 1 ? $firstTouristISValid : .constant(true),
                                number: index
                            )
                        }
                    }
                    
                    AddTouristView(touristCount: $touristCount)
                        .padding(.bottom, bottomSize.height)
                }
            }
            .padding(.vertical, AppGrid.pt8)
            .background(AppColors.backgroundList)
            
            NavigationButton(title: "Оплатить", destination: EmptyView()) {
                print("Pay did tap")
                customer = Customer(phone: phone, email: email)
            }
            .disabled(!isAllValid)
            .padding(AppGrid.pt16)
            .padding(.bottom, AppGrid.pt12)
            .background(.background)
            .border(width: AppGrid.pt1, edges: [.top], color: AppColors.seporator)
            .readSize { size in
                bottomSize = size
            }
            .onChange(of: validationables) {
                isAllValid = validationables.isValid
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationTitle("Бронирование")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func touristWrapper(id: Int) -> Binding<Tourist> {
        let tourist = Binding<Tourist>(
            get: { .init(id: id) },
            set: { tourist in
                guard tourist.isValid() else { return }
                if let index = tourists.firstIndex(where: { $0.id == id }) {
                    tourists[index] = tourist
                } else {
                    tourists.append(tourist)
                }
            }
        )
        
        return tourist
    }
    
    private func readTourists() {
        //        Array(1...touristCount).forEach { index in
        //            tourists.append(
        //                Tourist(
        //                    id: index,
        //                    name: <#T##String#>,
        //                    surname: <#T##String#>,
        //                    dateOfBirth: <#T##Date#>,
        //                    citizenship: <#T##String#>,
        //                    internationalPassport: <#T##String#>,
        //                    internationalPassportEndDate: <#T##Date#>
        //                )
        //            )
        //        }
    }
}

#Preview {
    BookingView(booking: .placeholder)
}
