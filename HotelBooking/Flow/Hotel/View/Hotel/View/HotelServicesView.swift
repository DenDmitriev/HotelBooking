//
//  HotelServicesView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct HotelServicesView: View {
    
    let services: [Service] = [
        .init(type: .facilities),
        .init(type: .included),
        .init(type: .notIncluded)
    ]
    
    var body: some View {
        VStack {
            ForEach(Array(zip(services.indices, services)), id: \.0) { index, service in
                VStack(alignment: .leading, spacing: AppGrid.pt10) {
                    NavigationLink(destination: EmptyView()) {
                        HStack(spacing: AppGrid.pt12) {
                            Image(service.type.image)
                                .foregroundStyle(Color.primary)
                            
                            ZStack(alignment: .trailing) {
                                VStack(alignment: .leading) {
                                    Text(service.type.title)
                                        .font(AppFonts.headline2)
                                        .foregroundStyle(AppColors.primaryTwo)
                                    
                                    Text(service.utility)
                                        .font(AppFonts.caption1)
                                        .foregroundStyle(AppColors.grayOne)
                                    
                                    if index != services.count - 1 {
                                        Divider()
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "chevron.right")
                                    .font(.headline)
                                    .foregroundStyle(Color.primary)
                                    .padding(AppGrid.pt6)
                            }
                        }
                    }
                    .disabled(true)
                }
            }
        }
        .padding(AppGrid.pt15)
//        .background(.red)
        .background(AppColors.backgroundTag)
        .cornerRadius(AppGrid.pt15)
    }
}

#Preview {
    HotelServicesView()
}
