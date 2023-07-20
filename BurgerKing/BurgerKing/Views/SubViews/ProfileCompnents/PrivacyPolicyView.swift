//
//  PrivacyPolicyView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 09/07/2023.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode

    var body: some View {
        ZStack {
            Color.bkBG
                .ignoresSafeArea()
            VStack {
                CustomNavigationBar(title: "Privacy Policy", presentationMode: presentationMode) // Pass the presentationMode

                WebView(url: URL(string: "https://www.burgerking.com.sa/privacy-policy/")!)
            }
        }.navigationBarBackButtonHidden()
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}




