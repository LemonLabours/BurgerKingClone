//
//  HomeView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var isShowingBranches = false

    var body: some View {
        ZStack {
            Color.bkBG
                .ignoresSafeArea()

            // First Part: Image taking the top part of the screen
            VStack {
                Image("home")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300) // Adjust the height as needed

                Spacer()
            }

            // Second Part: Horizontal scrolling menu showing nearest branches
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
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            locationManager.requestLocationPermission()
            locationManager.fetchNearestBranches()
            isShowingBranches = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

