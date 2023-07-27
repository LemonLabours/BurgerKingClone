//
//  FaceBookAuthentication .swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 26/07/2023.
//

import Foundation
import FacebookLogin

final class FaceBookAuthentication {
    let loginManager = LoginManager()

    func loginFaceBook(completionBlock: @escaping(Result<String , Error>)-> Void) {
        loginManager.logIn(permissions: ["email"],
                           from: nil) { LoginManagerLoginResult, error in
            if let error = error {
                print("Error with Facebook login \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let token = LoginManagerLoginResult?.token?.tokenString
            completionBlock(.success(token ?? "Empty Token"))
        }
    }
}
