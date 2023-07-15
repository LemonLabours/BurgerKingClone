//
//  MapDirectory.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 13/07/2023.
//

import Foundation
import CoreLocation
import MapKit

struct BKMapDirectory {
    let branches: [Branch] = {
        guard let jsonURL = Bundle.main.url(forResource: "bklocation", withExtension: ".json") else {
            fatalError("Unable to load json file")
        }

        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            return try decoder.decode([Branch].self, from: jsonData)
        } catch {
            fatalError("Unable to load or parse json file: \(error)")
        }
    }()
}
