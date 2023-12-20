//
//  PersonalTextField.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct PersonalTextField: View {
    
    let placeholder: String
    @Binding var personal: String
    @Binding var isValidate: Bool?
    let validation: (() -> Bool)?
    
    var body: some View {
        WrapperTextField(placeholder: placeholder, textField: textFiled, text: $personal, isValidate: $isValidate)
    }
    
    var textFiled: some View {
        TextField(placeholder, text: $personal, onEditingChanged: { isFocused in
            if isValidate != nil {
                if isFocused {
                    changed()
                } else {
                    committed()
                }
            }
        }) {
            committed()
        }
        .onChange(of: personal) { _ in
            if isValidate != nil {
                committed()
            }
        }
        .onChange(of: isValidate) { _ in
            committed()
        }
    }
    
    private func committed() {
        isValidate = validation?() ?? true
    }
    
    private func changed() {}
}

#Preview {
    PersonalTextField(placeholder: "Placeholder", personal: .constant(""), isValidate: .constant(nil), validation: nil)
}
