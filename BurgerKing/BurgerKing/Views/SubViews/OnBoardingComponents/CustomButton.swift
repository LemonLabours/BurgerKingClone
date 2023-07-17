//
//  CustomButton.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 17/07/2023.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .flame(font: .regular, size: adaptiveTextSize(size: 24, max: 42))
                .frame(maxWidth: .infinity, minHeight: 56)
                .background(Color.bkRed)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding(16)
    }


}
