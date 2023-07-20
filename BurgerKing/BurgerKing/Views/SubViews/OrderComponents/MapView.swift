//
//  MapView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 16/07/2023.

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D?
    var branches: [Branch]

    @State private var mapCenterCoordinate: CLLocationCoordinate2D?

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the map center when the coordinate changes
        if let coordinate = coordinate, coordinate != mapCenterCoordinate {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: false)
            mapCenterCoordinate = coordinate
        }

        // Remove existing annotations before adding new ones
        uiView.removeAnnotations(uiView.annotations)

        // Add annotations for each branch
        for branch in branches {
            let annotation = BranchAnnotation(title: branch.name, subtitle: branch.address, coordinate: CLLocationCoordinate2D(latitude: branch.latitude, longitude: branch.longitude))
            uiView.addAnnotation(annotation)
        }
    }

    // Coordinator to handle the map view delegate methods
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        // Customize the annotation view
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is BranchAnnotation else {
                return nil
            }

            let identifier = "branchAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            } else {
                annotationView?.annotation = annotation
            }

            annotationView?.glyphText = "🍔"
            annotationView?.markerTintColor = .white
            annotationView?.glyphTintColor = .black
            annotationView?.canShowCallout = true
            return annotationView
        }
    }
}


extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
