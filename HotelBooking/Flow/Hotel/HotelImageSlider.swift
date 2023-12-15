//
//  HotelImageSlider.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import SwiftUI

struct HotelImageSlider: View {
    let imageURLs: [String]
    @Binding var selection: Int
    @State private var size: CGSize = .zero
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(Array(zip(imageURLs.indices, imageURLs)), id: \.0) { index, imageURL in
                if let url = URL(string: imageURL) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        placeholder
                    }
                    .tag(index)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .overlay(content: {
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        size = geometry.size
                    }
            }
        })
        .overlay(alignment: .bottom, content: {
            HStack(spacing: AppGrid.pt5, content: {
                ForEach(imageURLs.indices, id: \.self) { index in
                    let opacityFactor = Double(abs(selection - index) - 1)
                    let opacityInactive = 0.2 - (0.05 * opacityFactor)
                    Circle()
                        .fill(.primary)
                        .opacity(index == selection ? 1 : opacityInactive)
                        .frame(height: AppGrid.pt6)
                        .onTapGesture {
                            withAnimation {
                                selection = index
                            }
                        }
                }
            })
            .padding(AppGrid.pt5)
            .background {
                RoundedRectangle(cornerRadius: AppGrid.pt5)
                    .fill(.background)
            }
                .frame(height: AppGrid.pt18)
                .padding(AppGrid.pt8)
        })
        .frame(height: size.width / 4 * 3)
        .cornerRadius(AppGrid.pt15)
    }
    
    var placeholder: some View {
        ZStack {
            Color.gray
            
            ProgressView()
                .progressViewStyle(.circular)
                .foregroundColor(.primary)
        }
    }
}

#Preview("HotelImageSlider") {
    HotelImageSlider(imageURLs: Hotel.placeholder.imageUrls, selection: .constant(.zero))
}
