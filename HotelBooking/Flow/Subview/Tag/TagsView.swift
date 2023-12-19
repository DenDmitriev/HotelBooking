//
//  TagsView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct TagsView: View {
    
    let tags: [String]
    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry.size)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: totalHeight)
    }
    
    private func generateContent(in size: CGSize) -> some View {
        var width: CGFloat = .zero
        var height: CGFloat = .zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(tags, id: \.self) { tag in
                TagItem(text: tag)
                    .padding(AppGrid.pt4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

#Preview("Tags View", traits: .fixedLayout(width: 350, height: 500)) {
    TagsView(tags: Hotel.placeholder.aboutTheHotel.peculiarities)
}
