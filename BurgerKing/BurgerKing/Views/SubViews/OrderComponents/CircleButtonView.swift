//
//  CircleButtonView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 16/07/2023.
//

import SwiftUI

// Custom View for the circular buttons
struct CircleButtonView: View {
    let imageName: String
    let buttonText: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .foregroundColor(.bkDarkBrown)
                .font(.system(size: 32))
                .frame(width: 64, height: 64)
                .background(Color.bkDarkBG)
                .clipShape(Circle())
            Text(buttonText)
                .font(.caption)
                .foregroundColor(.bkDarkBrown)
        }
    }
}



