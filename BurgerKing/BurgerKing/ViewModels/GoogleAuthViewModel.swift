//
//  GoogleAuthViewModel.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 21/07/2023.
import SwiftUI
import FirebaseCore
import GoogleSignIn
import Firebase

class GoogleAuthViewModel: ObservableObject {
    @Published var isLoginSuccessed = false

    func signInWithGoogle () {
        //get app client id.
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        //create google sign in configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        //sign in method goes here..
        GIDSignIn.sharedInstance.signIn(withPresenting: AuthenticationManager.rootViewController) { user, error in
            if let error = error {
                print (error.localizedDescription)
                return
            }

            guard let user = user?.user, let idToken = user.idToken else { return }

            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)

            Auth.auth().signIn(with: credential) { res, error in
                if let error = error {
                    print (error.localizedDescription)
                    return
                }

                guard let user = res?.user else { return }
                print (user)

                // Set the login success flag to true
                self.isLoginSuccessed = true
            }
        }
    }
}

