//
//  HomeView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var isShowingBranches = false
    @State private var isLoading = true
    @Binding var selectedTab: Int

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .top) {
                    Color.bkDarkBG
                        .ignoresSafeArea()

                    Rectangle()
                        .foregroundColor(.bkDarkBrown)
                        .frame(height: geometry.size.height * 0.45)
                        .edgesIgnoringSafeArea(.top)

                    VStack(spacing: 0) {
                        Image("home")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.35)
                            .offset(y: geometry.size.height * 0.16)

                        Button(action: {
                            selectedTab = 1
                        }) {
                            Text("Order now!")
                                .flame(font: .regular, size: adaptiveTextSize(size: 24, max: 48))
                                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.09)
                                .background(Color.bkRed)
                                .foregroundColor(.bkBG)
                                .cornerRadius(8)
                        }
                        .padding(.bottom, geometry.size.height * 0.04)
                        .padding(.top, geometry.size.height * 0.26)

                        HStack(spacing: geometry.size.width * 0.05) {
                            Text("Locations")
                                .flame(font: .bold, size: adaptiveTextSize(size: 24, max: 40))
                                .foregroundColor(.bkDarkBrown)
                            Spacer()
                            Button(action: {
                                selectedTab = 1
                            }) {
                                Text("View all")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.bkRed)
                            }
                        }
                        .padding(.horizontal, geometry.size.width * 0.05
                            )
                        .padding(.vertical, geometry.size.width * 0.02
                            )
                        .background(Color.bkBG)

                        ScrollView(.horizontal) {
                            HStack(spacing: geometry.size.width * 0.04) {
                                ForEach(locationManager.nearestBranches) { branch in
                                    BranchCardView(branch: branch, userLocation: locationManager.userLocation)
                                }
                            }
                            .padding(.horizontal, geometry.size.width * 0.04)
                            .padding(.bottom, geometry.size.height * 0.04)
                        }
                        .background(Color.bkBG)
                        .alignmentGuide(.bottom) { d in d[.bottom] }
                        .onAppear {
                            if isLoading {
                                locationManager.requestLocationPermission()
                                locationManager.fetchNearestBranches()
                                isLoading = false
                                isShowingBranches = true
                            }
                        }

                        Spacer()
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(0))
    }
}
