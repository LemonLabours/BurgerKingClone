//
//  Branch.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 13/07/2023.
//

import Foundation
import MapKit

final class Branch: NSObject, Decodable, Identifiable {
    let name: String
    let latitude: Double
    let longitude: Double
    let openingHours: [String: String]
    let closingHours: [String: String]
    let id = UUID()

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        openingHours = try container.decode([String: String].self, forKey: .openingHours)
        closingHours = try container.decode([String: String].self, forKey: .closingHours)
    }

    enum CodingKeys: String, CodingKey {
        case name
        case latitude
        case longitude
        case openingHours
        case closingHours
    }
}

extension Branch: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    var title: String? {
        name
    }
}
