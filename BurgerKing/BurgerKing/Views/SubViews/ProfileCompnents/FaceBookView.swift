//
//  FaceBookView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 20/07/2023.
//

import SwiftUI

struct FaceBookView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode

    var body: some View {
        ZStack {
            Color.bkBG
                .ignoresSafeArea()
            VStack {
                CustomNavigationBar(title: "Follow BK", presentationMode: presentationMode) // Pass the presentationMode

                WebView(url: URL(string: "https://www.facebook.com/BurgerKingArabia/")!)
            }
        }.navigationBarBackButtonHidden()
    }
}
struct FaceBookView_Previews: PreviewProvider {
    static var previews: some View {
        FaceBookView()
    }
}
