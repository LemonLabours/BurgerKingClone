//
//  CustomNavigationBar.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 20/07/2023.
//
import SwiftUI

struct CustomNavigationBar: View {
    var title: String
    var presentationMode: Binding<PresentationMode> // Add presentationMode parameter

    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss() // Dismiss the view when the back button is tapped
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.bkDarkBrown)
                    .font(.title2)
            }

            Spacer()

            Text(title)
                .font(.headline)
                .foregroundColor(.black)

            Spacer()
        }
        .padding(.all, 8)
        .padding(.trailing)
        .padding(.top, 2)
        .background(Color.bkBG)
    }
}

