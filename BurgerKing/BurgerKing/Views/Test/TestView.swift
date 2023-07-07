//
//  TestView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Regular Font")
                .flame(font: .regular, size: 20)

            Text("Bold Font")
                .flame(font: .bold, size: 24)

            Text("Sans Font")
                .flame(font: .sans, size: 18)

            Text("Sans Regular Font")
                .flame(font: .sansRegular, size: 16)

            Text("Regular Font (flameRegular)")
                .flame(font: .regularFont, size: 22)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
