//
//  BranchCardView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 16/07/2023.
//
import SwiftUI
import CoreLocation



struct BranchCardView: View {
    let branch: Branch

    private var todayOpeningHours: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let today = dateFormatter.string(from: Date()).lowercased()

        if let openingTime = branch.openingHours[today], let closingTime = branch.closingHours[today] {
            return "Today \(openingTime) - \(closingTime)"
        } else {
            return "Today Closed"
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(branch.name)
                .flame(font: .regular , size: 24)
                .foregroundColor(.bkDarkBrown)

            Text(String(format: "%.1f km", calculateDistanceFromUser()))
                .flame(font: .regular , size: 16)
                .foregroundColor(.bkDarkBrown)

            Text(branch.address)
                .font(.title3)
                .foregroundColor(.bkBrown)

            Text(todayOpeningHours)
                .font(.title3)
                .foregroundColor(.bkBrown)
        }
        .padding(24)
        .background(Color.bkBG)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.bkDarkBG, lineWidth: 1) 
        )
    }

    // Function to calculate distance from user location to branch location
    private func calculateDistanceFromUser() -> Double {
        guard let userLocation = LocationManager.shared.userLocation else {
            return 0.0
        }

        let branchLocation = CLLocation(latitude: branch.latitude, longitude: branch.longitude)
        return userLocation.distance(from: branchLocation) / 1000.0 // Convert to kilometers
    }
}



struct BranchCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Get the first branch from the BKMapDirectory branches
        let dummyBranch = BKMapDirectory().branches[0]

        // Dummy user location data
        let dummyUserLocation = CLLocation(latitude: 37.23456, longitude: -122.7890)

        BranchCardView(branch: dummyBranch)
    }
}

