//
//  NavigationRouter.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

protocol NavigationRouter: Hashable, Identifiable {
    associatedtype V: View
    
    var title: String { get }
    
    @ViewBuilder
    func view() -> V
}
