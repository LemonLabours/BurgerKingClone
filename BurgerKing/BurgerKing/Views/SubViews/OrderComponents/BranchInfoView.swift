//
//  BranchInfoView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 20/07/2023.

import SwiftUI
import CoreLocation

struct BranchInfoView: View {
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
                .flame(font: .regular , size: 16)
                .foregroundColor(.bkDarkBrown)

            Text("Delivery")
                .font(.subheadline)
                .foregroundColor(.bkBrown)

            Text(branch.address)
                .font(.subheadline)
                .foregroundColor(.bkBrown)

            Text(todayOpeningHours)
                .font(.subheadline)
                .foregroundColor(.bkBrown)
            Divider()


        }.padding(.horizontal, 24)
            .padding(.vertical, 8)
            .background(Color.bkBG)

    }

}


struct BranchInfoView_Previews: PreviewProvider {
    static var previews: some View {

        let dummyBranch = BKMapDirectory().branches[0]


        BranchInfoView(branch: dummyBranch)
    }
}
