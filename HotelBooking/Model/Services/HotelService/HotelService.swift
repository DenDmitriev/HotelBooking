//
//  HotelService.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 14.12.2023.
//

import Foundation

final class HotelService {
    
    private static let host = "https://run.mocky.io"
    
    /// API method for get hotel
    ///
    /// GET /v3/d144777c-a67f-4e35-867a-cacc3b827473 HTTP/1.1
    ///
    /// Host: run.mocky.io
    ///
    /// - Returns: `Result<Hotel, Error>`
    static func getHotel() async -> Result<Hotel, Error> {
        guard var url = URL(string: host) else { return .failure(HotelServiceError.urlFailure(url: host)) }
        url.append(path: "v3/d144777c-a67f-4e35-867a-cacc3b827473")
        let request: URLRequest = .init(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let result = try JSONDecoder().decode(Hotel.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
    
    /// API method for get rooms
    ///
    /// GET /v3/8b532701-709e-4194-a41c-1a903af00195 HTTP/1.1
    ///
    /// Host: run.mocky.io
    ///
    /// - Returns: `Result<[Room], Error>`
    static func getRooms() async -> Result<[Room], Error> {
        guard var url = URL(string: host) else { return .failure(HotelServiceError.urlFailure(url: host)) }
        url.append(path: "v3/8b532701-709e-4194-a41c-1a903af00195")
        let request: URLRequest = .init(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let result = try JSONDecoder().decode(Rooms.self, from: data)
            return .success(result.rooms)
        } catch {
            return .failure(error)
        }
    }
    
    /// API method for get booking
    ///
    /// GET /v3/63866c74-d593-432c-af8e-f279d1a8d2ff HTTP/1.1
    ///
    /// Host: run.mocky.io
    ///
    /// - Returns: `Result<Booking, Error>`
    static func getBooking() async -> Result<Booking, Error> {
        guard var url = URL(string: host) else { return .failure(HotelServiceError.urlFailure(url: host)) }
        url.append(path: "v3/63866c74-d593-432c-af8e-f279d1a8d2ff")
        let request: URLRequest = .init(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formatter)
            let result = try decoder.decode(Booking.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
