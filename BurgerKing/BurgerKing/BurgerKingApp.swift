//
//  BurgerKingApp.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 06/07/2023.
//

import SwiftUI

@main
struct BurgerKingApp: App {
    @StateObject private var locationViewModel = AllowLocationViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationViewModel)
        }
    }
}
