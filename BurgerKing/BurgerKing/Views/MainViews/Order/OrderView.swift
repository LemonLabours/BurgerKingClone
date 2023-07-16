//
//  OrderView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
//
import SwiftUI
import CoreLocation
import MapKit

struct OrderView: View {
    @Binding var selectedTab: Int

    @State private var isShowingBranches = false // Add a @State variable to control the visibility of branch cards

    var body: some View {
        ZStack(alignment: .top) {
            Color.bkBG
                .ignoresSafeArea()

            VStack {
                HStack {
                    Text("Current Location")
                        .font(.title2)
                        .foregroundColor(.bkDarkBrown)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.bkDarkBrown)

                    Spacer()
                    Image(systemName: "list.bullet")
                        .foregroundColor(.bkDarkBrown)
                        .font(.title)

                }
                .bold()
                .padding(20)
                .padding(.horizontal, 10)

                HStack(spacing: 16) {
                    Button(action: {
                        // Action for the first button
                    }) {
                        CircleButtonView(imageName: "bag.fill", buttonText: "Takeout")
                    }
                    Button(action: {
                        // Action for the second button
                    }) {
                        CircleButtonView(imageName: "scooter", buttonText: "Delivery")
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)

                // Add the MapView to show the user's current location
                if let userCoordinate = LocationManager.shared.userLocation?.coordinate {
                    MapView(coordinate: userCoordinate)
                        .frame(height: 620)
                        .padding(.bottom, 16)
                }
            }


            VStack{
                Spacer()
                ZStack {
                    if isShowingBranches {
                        ScrollView(.horizontal) {
                            HStack(spacing: 16) {
                                ForEach(LocationManager.shared.nearestBranches) { branch in
                                    BranchCardView(branch: branch)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                        }
                        .frame(height: 200)
                        .cornerRadius(16)
                        .shadow(radius: 5)
                        .padding(.horizontal, 16)
                    }
                }
                .offset(y: isShowingBranches ? -10 : 10) // Adjust the offset to control the floating behavior
            }

        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            LocationManager.shared.requestLocationPermission()
            LocationManager.shared.fetchNearestBranches()
            isShowingBranches = true
        }
    }
}



struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(selectedTab: .constant(0))
    }
}
