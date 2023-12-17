//
//  CustomTextFiled.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI
import Combine

struct PhoneTextFiled: View {
    let placeholder: String = "Номер телефона"
    @Binding var phone: String
    @Binding var isValidate: Bool?
    
    var body: some View {
        WrapperTextField(placeholder: placeholder, textField: textFiled, text: $phone, isValidate: $isValidate)
    }
    
    var textFiled: some View {
        PhoneMaskView(placeholder: placeholder, text: $phone, isValidate: $isValidate)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    PhoneTextFiled(phone: .constant("+7"), isValidate: .constant(nil))
}
