//
//  ProfileView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.bkDarkBG
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HeaderView()
                


                ZStack{

                    VStack(spacing: 32) {
                        HStack {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .foregroundColor(.bkDarkBrown)
                            Text("Settings")
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 24))
                                .foregroundColor(.bkDarkBrown)
                            Spacer()

                            Button(action: {

                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.bkBrown)
                                    .font(.subheadline)
                            }
                        }

                        HStack {
                            Image(systemName: "door.left.hand.open")
                                .font(.title2)
                                .foregroundColor(.bkDarkBrown)
                            HStack {
                                Text("Create Account")
                                    .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 24))
                                Circle()
                                    .frame(width: 8, height: 8)
                                Text("Sign in")
                                    .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 24))
                            }
                            .foregroundColor(.bkDarkBrown)
                            Spacer()

                            Button(action: {

                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.bkBrown)
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                }
                    .background(Color.bkBG)

                ZStack{
                    VStack (spacing:32){
                        HStack{
                            Text("Connect")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .bold, size: adaptiveTextSize(size: 28, max: 48))
                                .padding(.horizontal, 24)
                                .padding(.bottom, 12)
                            Spacer()
                        }
                        HStack{
                            Text("Follow BK")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Button{
                            }label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.bkBrown)
                                    .font(.subheadline)
                            }
                        } .padding(.horizontal, 24)

                        HStack{
                            Text("Contact BK")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Button{
                            }label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.bkBrown)
                                    .font(.subheadline)
                            }
                        } .padding(.horizontal, 24)
                    }  .padding(.vertical, 16)

                } .background(Color.bkBG)
                    .padding(.vertical, 12)




                Spacer()
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        ZStack {
            Color.bkBG
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .foregroundColor(.bkBG)
                .ignoresSafeArea(edges: .top)

            HStack {
                Text("Profile")
                    .foregroundColor(Color.bkDarkBrown)
                    .flame(font: .bold, size: adaptiveTextSize(size: 28, max: 48))
                    .padding(.horizontal,24)
                Spacer()
            }
        }
        .frame(height: 56) // Set the height of the header
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
