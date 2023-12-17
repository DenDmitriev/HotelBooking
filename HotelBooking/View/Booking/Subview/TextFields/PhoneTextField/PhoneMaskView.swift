//
//  NumberPhoneMaskView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct PhoneMaskView: View {
    
    let maskPhone  = "+X (XXX) XXX-XX-XX"
    let placeholder: String
    @Binding var text: String
    @Binding var isValidate: Bool?
    
    var body: some View {
        TextFieldContainer(placeholder, text: textChangedBinding(), isValidate: $isValidate)
    }
    
    private func textChangedBinding() -> Binding<String> {
        Binding<String>(
            get: {
                FilterPhone.format(with: maskPhone, phone: text)
            },
            set: {
                text = $0
            }
        )
    }
}

struct NumberPhoneMaskView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneMaskView(placeholder: "Номер телефона", text: .constant(""), isValidate: .constant(nil))
    }
}

