//
//  NavigationButtonSecond.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct NavigationButtonSecond<Destination>: View where Destination: View {
    let title: String
    let destination: Destination
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(spacing: AppGrid.pt2) {
                Text(title)
                Image(systemName: "chevron.right")
                    .padding(AppGrid.pt6)
            }
            .font(AppFonts.headline2)
            .foregroundStyle(.accent)
            .padding(AppGrid.pt5)
            .padding(.leading, AppGrid.pt10)
            .padding(.trailing, AppGrid.pt2)
            .background {
                RoundedRectangle(cornerRadius: AppGrid.pt5)
                    .fill(.accent.opacity(0.1))
            }
            
        }
    }
}

#Preview {
    NavigationButtonSecond(title: "Подробнее", destination: EmptyView())
}
