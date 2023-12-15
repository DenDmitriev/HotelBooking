//
//  Hotel.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import Foundation

struct Hotel: Codable, Identifiable {
    let id: Int
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: About
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case adress = "adress"
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating = "rating"
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

extension Hotel {
    struct About: Codable {
        let description: String
        let peculiarities: [String]
    }
}

extension Hotel {
    init() {
        self.id = .zero
        self.name = ""
        self.adress = ""
        self.minimalPrice = .zero
        self.priceForIt = ""
        self.rating = .zero
        self.ratingName = ""
        self.imageUrls = []
        self.aboutTheHotel = .init(description: "", peculiarities: [])
    }
    
    static var placeholder: Self {
        guard let url = Bundle.main.url(forResource: "PlaceholderHotel", withExtension: "json") else { return .init() }
        do {
            let data = try Data(contentsOf: url)
            let hotel = try JSONDecoder().decode(Hotel.self, from: data)
            return hotel
        } catch {
            return .init()
        }
    }
}
