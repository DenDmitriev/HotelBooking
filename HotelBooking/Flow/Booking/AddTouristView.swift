//
//  AddTouristView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import SwiftUI

struct AddTouristView: View {
    
    @Binding var touristCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppGrid.pt16) {
            HStack {
                Text("Добавить туриста")
                    .font(AppFonts.title2)
                
                Spacer()
                
                WrapperButton(systemImage: "plus") {
                    withAnimation {
                        touristCount += 1
                    }
                }
            }
            .padding(.bottom, AppGrid.pt4)
        }
        .padding(AppGrid.pt16)
        .background(.background)
        .cornerRadius(AppGrid.pt15)
    }
}

#Preview {
    AddTouristView(touristCount: .constant(1))
}
