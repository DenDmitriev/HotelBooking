//
//  Booking.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import Foundation

struct Booking: Codable, Identifiable {
    let id: Int
    let hotelName: String
    let hotelAdress: String
    let horating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: Date
    let tourDateStop: Date
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
    
    init() {
        self.id = .zero
        self.hotelName = ""
        self.hotelAdress = ""
        self.horating = .zero
        self.ratingName = ""
        self.departure = ""
        self.arrivalCountry = ""
        self.tourDateStart = Date()
        self.tourDateStop = Date()
        self.numberOfNights = .zero
        self.room = ""
        self.nutrition = ""
        self.tourPrice = .zero
        self.fuelCharge = .zero
        self.serviceCharge = .zero
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case horating = "horating"
        case ratingName = "rating_name"
        case departure = "departure"
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room = "room"
        case nutrition = "nutrition"
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
    
    func totalPrice() -> Int {
        tourPrice
        + fuelCharge
        + serviceCharge
    }
}

extension Booking {
    static var placeholder: Self {
        guard let url = Bundle.main.url(forResource: "PlaceholderBooking", withExtension: "json") else { return .init() }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            decoder.dateDecodingStrategy = .formatted(formatter)
            let booking = try decoder.decode(Booking.self, from: data)
            return booking
        } catch {
            return .init()
        }
    }
}
