//
//  MapViewWithRecenterButton.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 20/07/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct MapViewWithRecenterButton: View {
    @Binding var coordinate: CLLocationCoordinate2D?
    var branches: [Branch]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            MapView(coordinate: coordinate, branches: branches)

            VStack {
                Button(action: {
            
                    coordinate = LocationManager.shared.userLocation?.coordinate
                }) {
                    Image(systemName: "location")
                        .padding(8)
                        .foregroundColor(.bkDarkBrown)
                        .bold()
                        .background(Color.bkBG)
                        .clipShape(Circle())

                }
                .padding(16)
            }
        }
    }
}
