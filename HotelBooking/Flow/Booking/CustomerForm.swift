//
//  CustomerInfoView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct CustomerForm: View {
    enum Field: Hashable {
        case phone
        case email
    }
    
    @Binding var customer: Customer
    @Binding var isValid: Bool?
    
    @State private var email: String = ""
    @State private var isEmailValid: Bool?
    
    @State private var phone: String = ""
    @State private var isPhoneValid: Bool?
    
    @FocusState private var focusedField: Field?
    
    private var validationables: Set<Bool?> {
        [isEmailValid, isPhoneValid]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppGrid.pt16) {
            Text("Информация о покупателе")
                .font(AppFonts.title2)
                .padding(.bottom, AppGrid.pt4)
            
            VStack(spacing: AppGrid.pt8) {
                PhoneTextFiled(phone: $phone, isValidate: $isPhoneValid)
                    .focused($focusedField, equals: .phone)
                    .onChange(of: phone) {
                        customer.phone = phone
                    }
                
                EmailTextField(email: $email, isValidate: $isEmailValid)
                    .focused($focusedField, equals: .email)
                    .onChange(of: email) {
                        customer.email = email
                    }
            }
            .onSubmit {
                if focusedField == .phone {
                    focusedField = .email
                } else {
                    focusedField = nil
                }
            }
            .onChange(of: validationables) {
                self.isValid = validationables.isValid
            }
            
            Text("Эти данные никому не передаются. После оплаты мы вышлtv чек на указанный вами номер и почту")
                .font(AppFonts.regular2)
                .foregroundStyle(AppColors.grayOne)
        }
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt15)
    }
}

#Preview {
    CustomerForm(customer: .constant(.init(phone: "", email: "")), isValid: .constant(false))
}
