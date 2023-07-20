//
//  FollowView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 18/07/2023.
//

import SwiftUI

struct FollowView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode
    @State private var isShowingFacebookView = false
    @State private var isShowingTwitterView = false
    @State private var isShowingInstagramView = false
    @State private var isShowingYoutubeView = false

    var body: some View {
        ZStack {
            Color.bkDarkBG
                .ignoresSafeArea()

            VStack {
                CustomNavigationBar(title: "Follow BK", presentationMode: presentationMode)

                VStack(spacing: 16) {
                    Button(action: {
                        isShowingFacebookView = true
                    }) {
                        HStack {
                            Image("facebook")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("@BurgerKingArabia")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }
                    }

                    Button(action: {
                        isShowingTwitterView = true
                    }) {
                        HStack {
                            Image("twitter")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("@burgerKingksa")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }
                    }

                    Button(action: {
                        isShowingInstagramView = true
                    }) {
                        HStack {
                            Image("instagram")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.trailing, 10)

                            Text("@burgerKingksa")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }
                    }

                    Button(action: {
                        isShowingYoutubeView = true
                    }) {
                        HStack {
                            Image("youtube")

                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.trailing, 10)
                            Text("BurgerKingArabia")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }
                    }

                }
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
                .background(Color.bkBG)
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isShowingFacebookView) {
            FaceBookView()
        }
        .fullScreenCover(isPresented: $isShowingTwitterView) {
            TwitterView()
        }
        .fullScreenCover(isPresented: $isShowingInstagramView) {
            InstagramView()
        }
        .fullScreenCover(isPresented: $isShowingYoutubeView) {
            YoutubeView()
        }
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        FollowView()
    }
}
