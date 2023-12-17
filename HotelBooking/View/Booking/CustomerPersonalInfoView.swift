//
//  CustomerInfoView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct CustomerPersonalInfoView: View {
    
    @Binding var email: String
    @Binding var isEmailValid: Bool?
    
    @Binding var phone: String
    @Binding var isPhoneValid: Bool?
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppGrid.pt16) {
            Text("Информация о покупателе")
                .font(AppFonts.title2)
                .padding(.bottom, AppGrid.pt4)
            
            VStack(spacing: AppGrid.pt8) {
                PhoneTextFiled(phone: $phone, isValidate: $isPhoneValid)
                
                EmailTextField(email: $email, isValidate: $isEmailValid)
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
    CustomerPersonalInfoView(email: .constant(""), isEmailValid: .constant(nil), phone: .constant(""), isPhoneValid: .constant(nil))
}
