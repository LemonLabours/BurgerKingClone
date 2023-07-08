//
//  LaunchView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 08/07/2023.
//

import SwiftUI
import UIKit

struct LaunchView: View {
    @State private var isIpad: Bool = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color.bkBG
                    .ignoresSafeArea()

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * (isIpad ? 0.15 : 0.40), height: geometry.size.height * (isIpad ? 0.15 : 0.40
                                                                                                    ))

            }
        }
    }
}
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
