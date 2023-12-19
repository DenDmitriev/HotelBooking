//
//  KeyboardAvoiding.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 18.12.2023.
//

import SwiftUI
import Combine

public extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

public extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

public struct KeyboardAvoiding: ViewModifier {
    @State var offset: CGFloat
    @State private var keyboardActiveAdjustment: CGFloat = 0
    
    public func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom, spacing: keyboardActiveAdjustment) {
                EmptyView().frame(height: 0)
            }
            .onReceive(Publishers.keyboardHeight) {
                self.keyboardActiveAdjustment = min($0, offset)
            }
    }
}

public extension View {
    func keyboardAvoiding(offset: CGFloat) -> some View {
        modifier(KeyboardAvoiding(offset: offset))
    }
}
