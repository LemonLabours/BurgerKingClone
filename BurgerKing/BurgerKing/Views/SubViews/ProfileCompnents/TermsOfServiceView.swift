//
//  TermsOfServiceView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 18/07/2023.
//

import SwiftUI



struct TermsOfServiceView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode

    var body: some View {
        ZStack {
            Color.bkBG
                .ignoresSafeArea()
            VStack {
                CustomNavigationBar(title: "Terms Of Service", presentationMode: presentationMode) // Pass the presentationMode

                WebView(url: URL(string: "https://www.burgerking.com.sa/terms-of-use/")!)
            }
        }.navigationBarBackButtonHidden()
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
