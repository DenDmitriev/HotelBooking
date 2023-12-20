//
//  ContentView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        HotelCoordinatorView(coordinator: coordinator)
    }
}

#Preview {
    ContentView()
}
