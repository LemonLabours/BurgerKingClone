//
//  BurgerKingApp.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 06/07/2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()

    return true

  }

}

@main
struct BurgerKingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var locationViewModel = AllowLocationViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationViewModel)
        }
    }
}
