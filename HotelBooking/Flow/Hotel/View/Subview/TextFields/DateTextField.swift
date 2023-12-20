//
//  DateTextField.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 18.12.2023.
//

import SwiftUI

struct DateTextField: View {
    
    let placeholder: String
    @Binding var date: Date?
    let initialDate: Date?
    @Binding var isValidate: Bool?
    let validation: (() -> Bool)?
    @State private var tempText: String = ""
    
    let formatter: DateFormatter = AppFormatter.dateFormatter
    
    var body: some View {
        WrapperTextField(
            placeholder: placeholder,
            textField: textFiled,
            text: $tempText,
            isValidate: $isValidate)
    }
    
    var textFiled: some View {
        TextField(placeholder, value: $date, formatter: AppFormatter.dateFormatter, onEditingChanged: { isFocused in
            tempText = "temp"
            if isFocused {
                changed()
            } else {
                committed()
            }
        }) {
            committed()
        }
        .onChange(of: date) { _ in
            if isValidate != nil {
                committed()
            }
        }
        .onChange(of: isValidate) { _ in
            committed()
        }
        .onAppear {
            if date == nil {
                tempText = ""
            } else {
                tempText = "temp"
            }
        }
        .keyboardType(.numbersAndPunctuation)
    }
    
    private func committed() {
        isValidate = validation?() ?? true
    }
    
    private func changed() {}
}

#Preview {
    DateTextField(placeholder: "Date", date: .constant(nil), initialDate: Date.now, isValidate: .constant(nil), validation: nil)
}
