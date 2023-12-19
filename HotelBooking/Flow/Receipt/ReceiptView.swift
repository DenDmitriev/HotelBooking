//
//  ReceiptView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 18.12.2023.
//

import SwiftUI

struct ReceiptView: View {
    
    let orderNumber = String(Int.random(in: 100000...999999))
    
    var body: some View {
        VStack(spacing: AppGrid.pt32) {
            ZStack {
                Circle()
                    .fill(AppColors.backgroundList)
                    .frame(width: AppGrid.pt96)
                
                Text("🎉")
                    .font(.system(size: AppGrid.pt44))
            }
            
            VStack(alignment: .center, spacing: AppGrid.pt20) {
                Text("Ваш заказ принят в работу")
                    .font(AppFonts.title2)
                
                Text("Подтверждение заказа №\(orderNumber) может занять некоторое время (от 1 часа до суток).\nКак только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .font(AppFonts.regular)
                    .foregroundStyle(AppColors.grayOne)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, AppGrid.pt8)
        }
        .padding(AppGrid.pt16)
        .background(.background)
        .toolbar(content: {
            ToolbarItem(placement: .bottomBar) {
                NavigationButton(
                    title: "Супер!",
                    destination: EmptyView()) {
                        
                    }
                    .padding(.top, AppGrid.pt16)
            }
        })
        .navigationTitle("Заказ оплачен")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ReceiptView()
}
