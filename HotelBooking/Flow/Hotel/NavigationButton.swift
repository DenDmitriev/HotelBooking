//
//  ActionButton.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct NavigationButton<Destination>: View where Destination : View {
    
    @State var title: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(AppFonts.headline2)
                .padding(AppGrid.pt15)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(content: {
                    RoundedRectangle(cornerRadius: AppGrid.pt15)
                        .fill(.accent)
                    
                })
        }
    }
}

#Preview {
    NavigationButton(title: "К выбору номера", destination: EmptyView())
}
