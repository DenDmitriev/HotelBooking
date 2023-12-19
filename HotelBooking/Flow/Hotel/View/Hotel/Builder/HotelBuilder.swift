//
//  HotelBuilder.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

final class HotelBuilder {
    @ViewBuilder
    static func build(coordinator: Coordinator<HotelRouter>?) -> some View {
        if let coordinator {
            let viewModel = HotelViewModel(coordinator: coordinator)
            HotelView(viewModel: viewModel, hotel: .placeholder)
        }
    }
}
