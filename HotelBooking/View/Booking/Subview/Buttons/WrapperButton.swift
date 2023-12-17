//
//  WrapperButton.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import SwiftUI

struct WrapperButton: View {
    
    let text: String?
    let systemImage: String?
    let action: (() -> Void)
    
    init(text: String? = nil, systemImage: String? = nil, action: @escaping () -> Void) {
        self.text = text
        self.systemImage = systemImage
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                if let text {
                    Text(text)
                        .font(AppFonts.regular)
                }
                
                if let systemImage {
                    Image(systemName: systemImage)
                }
            }
            .foregroundColor(.white)
            .padding(AppGrid.pt7)
            .background {
                RoundedRectangle(cornerRadius: AppGrid.pt5)
                    .fill(.accent)
            }
        })
    }
}

#Preview {
    WrapperButton(text: nil, systemImage: "plus", action: {})
}
