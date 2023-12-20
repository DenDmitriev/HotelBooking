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
    private let mask: PhoneFormatStyle.Mask = .ru
    
    var body: some View {
        WrapperTextField(placeholder: placeholder, textField: textFiled, text: $phone, isValidate: $isValidate)
            .onAppear {
                phoneMasked = phone.formatted(.phone(mask: mask))
            }
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
            // Применяем маску
            phoneMasked = phoneMasked.formatted(.phone(mask: mask))
            
            // Заполняем по маске недостающие символы
            let pattern = mask.pattern
            var index = pattern.startIndex
            for character in pattern {
                if phoneMasked.endIndex <= index {
                    phoneMasked.append(character)
                }
                index = pattern.index(after: index)
            }
            
            // Убираем маску
            phone = PhoneFormatter.unformatted(phoneMasked)
        }
        .onChange(of: phone) {
            if isValidate != nil {
                committed()
            }
        }
        .onChange(of: isValidate) {
            committed()
        }
        .disableAutocorrection(true)
        .keyboardType(.numbersAndPunctuation)
    }
    
    private func committed() {
        isValidate = phone.isPhone
    }
    
    private func changed() {}
}

#Preview("Phone text filed", traits: .sizeThatFitsLayout) {
    PhoneTextFiled(phone: .constant(""), isValidate: .constant(nil))
}
