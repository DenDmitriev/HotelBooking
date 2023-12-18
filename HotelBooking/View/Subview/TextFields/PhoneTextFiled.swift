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
    @State private var phoneMasked: String = ""
    
    var body: some View {
        WrapperTextField(placeholder: placeholder, textField: textFiled, text: $phone, isValidate: $isValidate)
    }
    
    var textFiled: some View {
        TextField(placeholder, text: $phoneMasked, onEditingChanged: { isFocused in
            if isFocused {
                changed()
            } else {
                committed()
            }
        }) {
            committed()
        }
        .onChange(of: phoneMasked) {
            phoneMasked = phoneMasked.formatted(.phone)
            let numbers = "+" + phoneMasked.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            phone = numbers
        }
        .onChange(of: phone) {
            if isValidate != nil {
                committed()
            }
        }
        .disableAutocorrection(true)
        .keyboardType(.numbersAndPunctuation)
    }
    
    private func committed() {
        isValidate = phone.isPhone
    }
    
    private func changed() {}
}

#Preview {
    PhoneTextFiled(phone: .constant(""), isValidate: .constant(nil))
}
