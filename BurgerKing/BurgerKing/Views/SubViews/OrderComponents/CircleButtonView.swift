//
//  CircleButtonView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 16/07/2023.
//

import SwiftUI

struct CircleButtonView: View {
    let imageName: String
    let buttonText: String
    let action: () -> Void 
    @State private var isTapped = false

    var body: some View {
        Button(action: {
            isTapped.toggle()
            action()
        }) {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(.bkDarkBrown)
                    .font(.system(size: 24))
                    .frame(width: 48, height: 48)
                    .background(isTapped ? Color.bkOrange : Color.bkCircleBG)
                    .clipShape(Circle())
                Text(buttonText)
                    .font(.caption)
                    .foregroundColor(.bkDarkBrown)
            }.padding(.horizontal, 8)
        }
    }
}
