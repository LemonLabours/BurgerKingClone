//
//  YoutubeView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 20/07/2023.
//

import SwiftUI

struct YoutubeView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode

    var body: some View {
        ZStack {
            Color.bkBG
                .ignoresSafeArea()
            VStack {
                CustomNavigationBar(title: "Follow BK", presentationMode: presentationMode) // Pass the presentationMode

                WebView(url: URL(string: "https://www.youtube.com/channel/UCRvFamAbvEPLLaR6UkW2vMw")!)
            }
        }.navigationBarBackButtonHidden()
    }
}
struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView()
    }
}
