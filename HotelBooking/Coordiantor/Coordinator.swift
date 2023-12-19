//
//  Coordinator.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

class Coordinator<Router: NavigationRouter>: ObservableObject, Equatable, Hashable {
    
    var id: UUID = UUID()
    
    @Published var path = NavigationPath()
    
    @Published var sheet: Router?
    @Published var cover: Router?
    
    @Published var hasError: Bool = false
    
    var error: LocalizedError?
    
    func push(_ page: Router) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(sheet: Router) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func present(cover: Router) {
        self.cover = cover
    }
    
    func dismissCover() {
        cover = nil
    }
    
    func presentAlert(error: LocalizedError) {
        self.error = error
        hasError = true
    }
    
    @ViewBuilder
    func build(_ route: Router, coordinator: Coordinator) -> some View {
        route.view(coordinator: coordinator)
    }
    
    static func == (lhs: Coordinator<Router>, rhs: Coordinator<Router>) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
