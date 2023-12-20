//
//  PriceDescriptorView.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 15.12.2023.
//

import SwiftUI

struct PriceDescriptorView: View {
    enum Rule: String {
        case from = "от "
        case normal = ""
    }
    
    let price: Int
    let descriptor: String
    let rule: Rule
    
    init(price: Int, descriptor: String, rule: Rule = .normal) {
        self.price = price
        self.descriptor = descriptor
        self.rule = rule
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(rule.rawValue + price.formatted(.price))
                .font(AppFonts.title1)
            
            Text(descriptor.lowercased())
                .font(AppFonts.regular)
                .foregroundStyle(AppColors.grayOne)
        }
    }
}

#Preview {
    PriceDescriptorView(price: 18600, descriptor: "За тур с перелётом", rule: .from)
}
