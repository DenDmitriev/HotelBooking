//
//  Placeholder.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 20.12.2023.
//

import SwiftUI

struct Placeholder: View {
    
    enum Style {
        case loading(text: String?)
        case text(text: String)
    }
    
    @State var style: Style
    
    var body: some View {
        switch style {
        case .loading(let text):
            VStack(spacing: AppGrid.pt16) {
                ProgressView()
                
                if let text {
                    Text(text)
                        .font(AppFonts.headline1)
                        .foregroundStyle(.gray)
                }
            }
        case .text(text: let text):
            Text(text)
                .font(AppFonts.headline1)
                .foregroundStyle(.gray)
        }
        
    }
}

#Preview {
    Placeholder(style: .loading(text: "Загрузка"))
}
