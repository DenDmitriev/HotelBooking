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
    let action: (() -> Void)?
    @State private var size: CGSize = CGSize(width: AppGrid.pt48, height: AppGrid.pt48)
    @Environment(\.isEnabled) private var isEnabled
    
    init(title: String, destination: Destination, action: (() -> Void)? = nil) {
        self._title = State(initialValue: title)
        self.destination = destination
        self.action = action
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(AppFonts.headline2)
                .padding(AppGrid.pt15)
                .foregroundColor(isEnabled ? .white : .secondary)
//                .frame(maxWidth: .infinity)
                .frame(width: UIScreen.main.bounds.size.width - AppGrid.pt16 * 2, height: AppGrid.pt48)
                .background(content: {
                    RoundedRectangle(cornerRadius: AppGrid.pt15)
                        .fill(isEnabled ? .accent : Color.seporator)
                })
        }
        .onDisappear(perform: {
            action?()
        })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NavigationButton(title: "К выбору номера", destination: EmptyView())
}
