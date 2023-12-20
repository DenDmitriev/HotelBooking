//
//  ToggleButton.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import SwiftUI

struct ToggleButton: View {
    
    let image: (on: String, of: String)
    let action: (() -> Void)
    @Binding var isOn: Bool
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: isOn ? image.on : image.of)
                .foregroundColor(.accent)
                .background {
                    RoundedRectangle(cornerRadius: AppGrid.pt5)
                        .fill(.accent.opacity(0.1))
                        .frame(width: 32, height: 32)
                }
                .frame(width: 32, height: 32)
        })
    }
}

#Preview {
    ToggleButton(image: (on: "chevron.up", of: "chevron.down"), action: {}, isOn: .constant(true))
}
