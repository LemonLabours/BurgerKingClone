//
//  MainTabView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 15/07/2023.
//

import SwiftUI


struct MainTabView: View {
    @State private var selectedTab: Int = 0

    init() {
        let customColor = UIColor(red: 0.29, green: 0.15, blue: 0.09, alpha: 1.0) // Replace with your custom color
        UITabBar.appearance().unselectedItemTintColor = customColor
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab) // Pass the selectedTab binding to HomeView
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            OrderView(selectedTab: .constant(0))
                .tabItem {
                    Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    Text("Order")
                }
                .tag(1)

            OffersView()
                .tabItem {
                    Image(systemName: "giftcard")
                    Text("Offers")
                }
                .tag(2)

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.red) // Set the accent color to red
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

