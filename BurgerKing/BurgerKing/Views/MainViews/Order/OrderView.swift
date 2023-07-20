//
//  OrderView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.

import SwiftUI
import CoreLocation
import MapKit

struct OrderView: View {
    @Binding var selectedTab: Int
    @StateObject private var locationManager = LocationManager()
    @State private var isShowingBranches = false

    // Add a new non-optional property to store the user location coordinate
    @State private var userCoordinate: CLLocationCoordinate2D?

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.bkBG
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Text("Current Location")
                            .font(.subheadline)
                            .foregroundColor(.bkDarkBrown)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.bkDarkBrown)

                        Spacer(minLength: 0)
                        Image(systemName: "list.bullet")
                            .foregroundColor(.bkDarkBrown)
                            .font(.title)
                    }
                    .bold()
                    .padding(.all, 16)

                    HStack(spacing: 16) {
                        CircleButtonView(imageName: "bag.fill", buttonText: "Takeout", action: {
                            print("Takeout is tapped")
                        })

                        // Use the NavigationLink to navigate to the MenuView
                        NavigationLink(destination: MenuView()) {
                            CircleButtonView(imageName: "scooter", buttonText: "Delivery", action: {
                                selectedTab = 1
                            })
                        }

                        Spacer()
                    }.padding(.horizontal, 16)

                    // Use MapViewWithRecenterButton with the new non-optional coordinate
                    MapViewWithRecenterButton(coordinate: $userCoordinate, branches: locationManager.nearestBranches)
                        .frame(height: 440)
                        .padding(.bottom, 16)
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

                // Assign the user location coordinate to the new non-optional property
                userCoordinate = locationManager.userLocation?.coordinate
            }
        }
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(selectedTab: .constant(0))
    }
}
