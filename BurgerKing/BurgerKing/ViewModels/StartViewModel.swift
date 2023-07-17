//
//  StartViewModel.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 17/07/2023.
//

import Foundation
import SwiftUI

class StartViewModel: ObservableObject {
    @Published var showingNotificationView = false


    // Function to handle the action of the "Let's Start" button
    func handleLetsStartButtonTapped() {
        showingNotificationView = true
    }
}
