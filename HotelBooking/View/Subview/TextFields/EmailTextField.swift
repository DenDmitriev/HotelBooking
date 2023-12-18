//
//  CustomTextField.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI
import Combine

struct EmailTextField: View {
    
    let placeholder: String = "Почта"
    @Binding var email: String
    @Binding var isValidate: Bool?
    
    var body: some View {
        WrapperTextField(placeholder: placeholder, textField: textFiled, text: $email, isValidate: $isValidate)
    }
    
    var textFiled: some View {
        TextField(placeholder, text: $email, onEditingChanged: { isFocused in
            if isFocused {
                changed()
            } else {
                committed()
            }
        }) {
            committed()
        }
        .onChange(of: email) {
            if isValidate != nil {
                committed()
            }
        }
        .disableAutocorrection(true)
        .keyboardType(.emailAddress)
        .onReceive(Just(email)) { newValue in
            let validString = newValue.filter { "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._-+$!~&=#[]@".contains($0) }
            if validString != newValue {
                self.email = validString
            }
        }
    }
    
    private func committed() {
        isValidate = email.isEmail
    }
    
    private func changed() {}
}

#Preview {
    EmailTextField(email: .constant(""), isValidate: .constant(nil))
}
