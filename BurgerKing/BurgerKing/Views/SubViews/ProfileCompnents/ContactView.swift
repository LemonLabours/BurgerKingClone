//
//  ContactView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 18/07/2023.
//

import SwiftUI

struct ContactView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode

    var body: some View {
        ZStack {
            Color.bkBG
                .ignoresSafeArea()
            VStack {
                CustomNavigationBar(title: "Contact BK", presentationMode: presentationMode) // Pass the presentationMode

                WebView(url: URL(string: "https://www.burgerking.com.sa/contact-us/")!)
            }
        }.navigationBarBackButtonHidden()
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
