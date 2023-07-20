//
//  TwitterView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 20/07/2023.
//

import SwiftUI

struct TwitterView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode

    var body: some View {
        ZStack {
            Color.bkBG
                .ignoresSafeArea()
            VStack {
                CustomNavigationBar(title: "Follow BK", presentationMode: presentationMode) // Pass the presentationMode

                WebView(url: URL(string: "https://twitter.com/burgerkingksa")!)
            }
        }.navigationBarBackButtonHidden()
    }
}
struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView()
    }
}
