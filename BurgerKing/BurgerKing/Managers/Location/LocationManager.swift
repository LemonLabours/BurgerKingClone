//
//  LocationManager.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 13/07/2023.

import Foundation
import CoreLocation
import MapKit

final class LocationManager: NSObject, ObservableObject {
    static let shared = LocationManager() // Add the shared instance

    @Published var userLocation: CLLocation?
    @Published var nearestBranches: [Branch] = []
    @Published var locationError: Error?

    private let locationManager = CLLocationManager()
    let branchLocations: [Branch] // Change the access level to internal

    override init() {
        self.branchLocations = BKMapDirectory().branches // Change the access level to internal
        super.init()
        locationManager.delegate = self
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func fetchNearestBranches() {
        guard let userLocation = userLocation else { return }

        var branches = branchLocations
        branches.sort { (branch1, branch2) -> Bool in
            let location1 = CLLocation(latitude: branch1.latitude, longitude: branch1.longitude)
            let location2 = CLLocation(latitude: branch2.latitude, longitude: branch2.longitude)
            return userLocation.distance(from: location1) < userLocation.distance(from: location2)
        }

        nearestBranches = Array(branches.prefix(3)) // Get the three nearest branches
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            startUpdatingLocation()
        case .denied, .restricted:
            locationError = NSError(domain: "Location", code: 0, userInfo: [NSLocalizedDescriptionKey: "Location permission denied or restricted."])
        default:
            break
        }
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location
        fetchNearestBranches()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationError = error
    }
}
