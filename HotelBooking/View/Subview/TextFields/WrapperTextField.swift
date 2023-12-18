//
//  CustomTextField.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct WrapperTextField<Field>: View where Field : View {
    
    let placeholder: String
    let textField: Field
    @Binding var text: String
    @Binding var isValidate: Bool?
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            if !text.isEmpty {
                Text(placeholder)
                    .font(AppFonts.regular2)
                    .foregroundStyle(AppColors.grayOne)
            }
            
            textField
                .frame(height: AppGrid.pt24)
        }
        .background(alignment: .leading, content: {
            if text.isEmpty {
                Text(placeholder)
                    .font(AppFonts.regular3)
                    .foregroundStyle(AppColors.grayOne)
            }
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: AppGrid.pt52)
        .padding(.horizontal, AppGrid.pt16)
        .padding(.vertical, AppGrid.pt10)
        .background(AppColors.backgroundList)
        .cornerRadius(AppGrid.pt10)
        .overlay {
            if !(isValidate ?? true) {
                RoundedRectangle(cornerRadius: AppGrid.pt10)
                    .fill(AppColors.error.opacity(0.15))
            }
        }
    }
}

#Preview {
    WrapperTextField(placeholder: "Placeholder", textField: TextField("", text: .constant("")), text: .constant(""), isValidate: .constant(nil))
}
