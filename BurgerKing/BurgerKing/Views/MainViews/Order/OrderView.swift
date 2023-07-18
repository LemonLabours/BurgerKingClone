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
    @StateObject private var locationManager = LocationManager()
    @State private var isShowingBranches = false

    var body: some View {
        ZStack(alignment: .top) {
            Color.bkBG
                .ignoresSafeArea()

            VStack {
                HStack {
                    Text("Current Location")
                        .font(.title3)
                        .foregroundColor(.bkDarkBrown)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.bkDarkBrown)

                    Spacer(minLength: 0)
                    Image(systemName: "list.bullet")
                        .foregroundColor(.bkDarkBrown)
                        .font(.title)
                }
                .bold()
                .padding(.horizontal, 16)
            

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

                if let userCoordinate = LocationManager.shared.userLocation?.coordinate {
                    MapView(coordinate: userCoordinate, branches: LocationManager.shared.branchLocations) // Pass the entire branchLocations array
                        .frame(height: 440)
                        .padding(.bottom, 16)
                }
            }

            VStack {
                Spacer()
                ScrollView(.horizontal) {
                    ScrollViewReader { proxy in
                        HStack(spacing: 16) {
                            ForEach(locationManager.nearestBranches) { branch in
                                BranchCardView(branch: branch, userLocation: locationManager.userLocation)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        .onChange(of: isShowingBranches) { newValue in
                            withAnimation {
                                proxy.scrollTo(newValue ? 0 : 1)
                            }
                        }
                    }
                }
                .frame(height: 180)
                .cornerRadius(16)
                .shadow(radius: 5)
                .padding(.horizontal, 16)
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

