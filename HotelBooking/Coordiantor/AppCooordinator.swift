//
//  AppCooordinator.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 20.12.2023.
//

import SwiftUI

class AppCoordinator: Coordinator {
    var type: HotelRouter { .hotel }
    
    @Published var path: NavigationPath = .init()
    
    @Published var sheet: HotelRouter?
    
    @Published var cover: HotelRouter?
    
    @Published var hasError: Bool = false
    
    var error: AppError?
    
    func push(_ page: HotelRouter) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(sheet: HotelRouter) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func present(cover: HotelRouter) {
        self.cover = cover
    }
    
    func dismissCover() {
        cover = nil
    }
    
    func presentAlert(error: AppError) {
        self.error = error
        hasError = true
    }
    
    
    @ViewBuilder
    func build(_ route: HotelRouter, coordinator: AppCoordinator) -> some View {
        route.view(coordinator: coordinator)
    }
}
