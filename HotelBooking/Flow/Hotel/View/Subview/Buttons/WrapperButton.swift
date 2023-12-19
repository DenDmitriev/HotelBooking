//
//  WrapperButton.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 17.12.2023.
//

import SwiftUI

struct WrapperButton: View {
    
    enum Style {
        case primary
        case toolbar
    }
    
    @State var style: Style = .primary
    let text: String?
    let systemImage: String?
    let action: (() -> Void)
    @Environment(\.isEnabled) private var isEnabled
    
    init(text: String? = nil, systemImage: String? = nil, action: @escaping () -> Void) {
        self.text = text
        self.systemImage = systemImage
        self.action = action
    }
    
    init(text: String, systemImage: String? = nil, action: @escaping () -> Void) {
        self.style = .toolbar
        self.text = text
        self.systemImage = systemImage
        self.action = action
    }
    
    var body: some View {
        switch style {
        case .primary:
            primary()
        case .toolbar:
            toolbar()
        }
    }
    
    func primary() -> some View {
        Button(action: action, label: {
            HStack {
                if let text {
                    Text(text)
                        .font(AppFonts.regular)
                }
                
                if let systemImage {
                    Image(systemName: systemImage)
                }
            }
            .foregroundColor(.white)
            .padding(AppGrid.pt7)
            .background {
                RoundedRectangle(cornerRadius: AppGrid.pt5)
                    .fill(.accent)
            }
        })
    }
    
    func toolbar() -> some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                if let text, let systemImage {
                    Label(text, systemImage: systemImage)
                } else {
                    Text(text ?? "Button")
                }
            }
            .font(AppFonts.headline2)
            .padding(AppGrid.pt15)
            .foregroundColor(isEnabled ? .white : .secondary)
            //                .frame(maxWidth: .infinity)
            .frame(width: UIScreen.main.bounds.size.width - AppGrid.pt16 * 2, height: AppGrid.pt48)
            .background(content: {
                RoundedRectangle(cornerRadius: AppGrid.pt15)
                    .fill(isEnabled ? .accent : Color.seporator)
            })
        })
    }
}

#Preview {
    VStack {
        WrapperButton(text: nil, systemImage: "plus", action: {})
        WrapperButton(text: "Toolbar button", action: {})
    }
}
