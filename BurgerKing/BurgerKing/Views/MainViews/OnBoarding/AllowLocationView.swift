//
//  AllowLocationView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
//

import SwiftUI

struct AllowLocationView: View {

            var body: some View {
                NavigationView {  // Add this line
                    GeometryReader { geometry in
                        ZStack {
                            Color.bkBG
                                .ignoresSafeArea()

                            VStack(spacing: 20){
                                Spacer()

                                Image("location")
                                    .resizable()
                                    .frame(width: geometry.size.width * (0.64), height: geometry.size.height * (0.32))
                                    .padding(.bottom , 78)

                                Text("Order at nearby \nresturants.")
                                    .foregroundColor(Color.bkDarkBrown)
                                    .flame(font: .bold, size: 36)
                                    .multilineTextAlignment(.center)

                                Text("We use your location to show \nnearby resturants and let you \norder from them.")
                                    .foregroundColor(Color.bkDarkBrown)
                                    .font(.title2)
                                    .multilineTextAlignment(.center)



                                Spacer()
                                    .frame(height: 10)

                                NavigationLink(destination: AllowNotificationView()) {
                                    Text("Turn on location")
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
struct AllowLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AllowLocationView()
    }
}
