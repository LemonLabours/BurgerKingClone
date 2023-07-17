//
//  MapView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 16/07/2023.
//
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D?
    var branches: [Branch]

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.delegate = context.coordinator
        if let coordinate = coordinate {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            uiView.setRegion(region, animated: true)

            // Remove existing annotations before adding new ones
            uiView.removeAnnotations(uiView.annotations)

            // Add annotations for each branch
            for branch in branches {
                let annotation = BranchAnnotation(title: branch.name, subtitle: branch.address, coordinate: CLLocationCoordinate2D(latitude: branch.latitude, longitude: branch.longitude))
                uiView.addAnnotation(annotation)
            }
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
