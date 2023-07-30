//
//  OffersView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
//

import SwiftUI

struct OffersView: View {
    var body: some View {
        ZStack{
            Color.bkBG
                .ignoresSafeArea()

            VStack{
                HStack{
                    Text("Offers")
                    Spacer()
                }.padding(20)
                    .foregroundColor(Color.bkDarkBrown)
                    .flame(font: .bold, size: adaptiveTextSize(size: 28, max: 48))


                Text("Your offers will show up here. We'll inform \nyou when new ones are available.").padding(.horizontal,20)
                    .foregroundColor(Color.bkBrown)
                    .font(.caption)
                    .bold()


                Spacer()
                HStack{
                    Spacer()

                    Button {
                    }label: {
                         HStack {
                            Image(systemName: "gift.fill")
                                .foregroundColor(.white)
                                .font(.title2)
                            Text("Enter Promo Code")
                                .foregroundColor(.white)
                                .font(.caption)
                                .bold()

                         }.padding()
                         .background(Color.bkRed)
                         .cornerRadius(35)
                         .padding()
                         }


                     }
                  }

               }

           }
        }


struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView()
    }
}
