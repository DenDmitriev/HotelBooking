//
//  Room.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import Foundation

struct Rooms: Codable {
    let rooms: [Room]
}

struct Room: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case pricePer = "price_per"
        case peculiarities = "peculiarities"
        case imageUrls = "image_urls"
    }
}
