//
//  Coordinator.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 19.12.2023.
//

import SwiftUI

protocol Coordinator: AnyObject, ObservableObject {
    associatedtype Router: NavigationRouter
    associatedtype Content: View
    associatedtype Error: LocalizedError
    
    var type: Router { get }
    
    var path: NavigationPath { get set }
    var sheet: Router? { get set }
    var cover: Router? { get set }
    
    var hasError: Bool { get set }
    var error: Error? { get set }
    
    func push(_ page: Router)
    func pop()
    func popToRoot()
    
    func present(sheet: Router)
    func dismissSheet()
    
    func present(cover: Router)
    func dismissCover()
    
    func presentAlert(error: Error)

    @ViewBuilder func build(_ route: Router, coordinator: Self) -> Content
}
