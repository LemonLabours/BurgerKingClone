//
//  HomeView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.bkBG
                .ignoresSafeArea()
            Text("Home")
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
