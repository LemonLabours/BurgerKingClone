//
//  BranchAnnotation.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 16/07/2023.
//

import Foundation
import MapKit



class BranchAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        super.init()
    }
}
