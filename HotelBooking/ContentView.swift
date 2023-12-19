//
//  ContentView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var coordinator: Coordinator = Coordinator<HotelRouter>()
    
    var body: some View {
        HotelCoordinator(coordinator: coordinator)
    }
}

#Preview {
    ContentView()
}
