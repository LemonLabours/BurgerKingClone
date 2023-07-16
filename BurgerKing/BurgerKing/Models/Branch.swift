//
//  Branch.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 13/07/2023.


import Foundation
import MapKit
import CoreLocation

final class Branch: NSObject, Decodable, Identifiable {
    let name: String
    let latitude: Double
    let longitude: Double
    let openingHours: [String: String]
    let closingHours: [String: String]
    let id = UUID()
    let address: String // Add the address property

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        openingHours = try container.decode([String: String].self, forKey: .openingHours)
        closingHours = try container.decode([String: String].self, forKey: .closingHours)
        address = try container.decode(String.self, forKey: .address) // Decode the address
    }

    enum CodingKeys: String, CodingKey {
        case name
        case latitude
        case longitude
        case openingHours
        case closingHours
        case address // Add address to the CodingKeys
    }
}
