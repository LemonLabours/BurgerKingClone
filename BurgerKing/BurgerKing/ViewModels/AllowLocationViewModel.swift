//
//  AllowLocationViewModel.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 15/07/2023.
//
import Foundation
import Combine
import CoreLocation

class AllowLocationViewModel: NSObject, ObservableObject {
    @Published var permissionStatus: LocationPermissionStatus = .notDetermined {
        didSet {
            if permissionStatus == .authorized {
                permissionGranted = true
            }
        }
    }

    @Published var permissionGranted: Bool = false

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
}

extension AllowLocationViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            permissionStatus = .authorized
        case .denied, .restricted:
            permissionStatus = .denied
        default:
            permissionStatus = .notDetermined
        }
    }
}
