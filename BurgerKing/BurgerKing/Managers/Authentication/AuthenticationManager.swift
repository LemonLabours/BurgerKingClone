//
//  AuthenticationManager.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 21/07/2023.
//

import SwiftUI

final class AuthenticationManager{

    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init ()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init ()
        }


        return root
    }
}
