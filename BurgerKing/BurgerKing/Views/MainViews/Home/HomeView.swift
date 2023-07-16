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
    @Binding var selectedTab: Int // Change the type to Binding<Int>

    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .top) {
                    Color.bkDarkBG
                        .ignoresSafeArea()


                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.bkDarkBrown)
                        .frame(height: 300)
                        .edgesIgnoringSafeArea(.top)

                    VStack(spacing: 0) {
                        Image("home")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 260)
                            .padding(.vertical, 60)
                        Spacer()
                        Button(action: {
                            selectedTab = 1 
                        }) {
                            Text("Order now!")
                                .flame(font: .regular, size: 32)
                                .frame(width: geometry.size.width * 0.8, height: 72)
                                .background(Color.bkRed)
                                .foregroundColor(.bkBG)
                                .cornerRadius(16)
                        }
                        .padding(.bottom, 32)

                        // Bottom Half
                        VStack(spacing: 0) {
                            HStack {
                                Text("Locations")
                                    .flame(font: .bold, size: 32)
                                    .foregroundColor(.bkDarkBrown)
                                Spacer()
                                Button(action: {
                                    selectedTab = 1
                                }) {
                                    Text("View all")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.bkRed)
                                }
                            }
                            .padding(20)

                            if isShowingBranches {
                                ScrollView(.horizontal) {
                                    HStack(spacing: 16) {
                                        ForEach(locationManager.nearestBranches) { branch in
                                            BranchCardView(branch: branch)
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 16)
                                }
                            }
                            Spacer()
                        }.background(Color.bkBG)

                        .alignmentGuide(.bottom) { d in d[.bottom] }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    locationManager.requestLocationPermission()
                    locationManager.fetchNearestBranches()
                    isShowingBranches = true
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTab: .constant(0))
    }
}
