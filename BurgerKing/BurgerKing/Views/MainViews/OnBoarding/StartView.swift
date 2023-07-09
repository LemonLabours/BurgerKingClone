//
//  StartView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 08/07/2023.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {  // Add this line
            GeometryReader { geometry in
                ZStack {
                    Color.bkBG
                        .ignoresSafeArea()

                    VStack(spacing: 20){
                        Spacer()

                        Image("logo")
                            .resizable()
                            .frame(width: geometry.size.width * (0.64), height: geometry.size.height * (0.32))
                            .padding(.bottom , 78)

                        Text("The easiest way \nto order")
                            .foregroundColor(Color.bkDarkBrown)
                            .flame(font: .bold, size: 36)
                            .multilineTextAlignment(.center)

                        Text("No lines. No waiting.")
                            .foregroundColor(Color.bkDarkBrown)
                            .font(.title2)

                        VStack {
                            Text("By proceeding you confirm that you have read our ")
                                .foregroundColor(Color.bkBrown)
                            NavigationLink(destination: PrivacyPolicyView()) {
                                Text("privacy policy")
                                    .underline()
                                    .foregroundColor(Color.bkDarkBrown)
                            }
                        }.font(.subheadline)

                        Spacer()
                            .frame(height: 10)

                        NavigationLink(destination: AllowNotificationView()) {
                            Text("Let's Start")
                                .flame(font: .regular, size: 32)
                                .frame(width: geometry.size.width * 0.9, height: 72)
                                .background(Color.bkRed)
                                .foregroundColor(.white)
                                .cornerRadius(22)

                        }
                        .padding(.bottom, 32)
                    }
                }
            }
        }  // And this line
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
