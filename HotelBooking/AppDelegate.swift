//
//  AppDelegate.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "arrow back") //UIImage(systemName: "arrow.backward")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "arrow back") // UIImage(systemName: "arrow.backward")
        return true
    }
}
