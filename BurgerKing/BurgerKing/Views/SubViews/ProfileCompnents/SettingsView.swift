//
//  SettingsView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 18/07/2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode

    var body: some View {
        ZStack {
            Color.bkDarkBG
                .ignoresSafeArea()
            VStack {
                CustomNavigationBar(title: "Settings", presentationMode: presentationMode) // Pass the presentationMode

                VStack{
                    HStack(){
                        Text("Manage")
                            .foregroundColor(Color.bkBrown)
                        Spacer()
                    }.padding(.leading, 32)
                        .padding(.vertical, 16)


                    Divider()
                        .foregroundColor(Color.bkBrown)

                        .padding(.horizontal)
                    VStack (spacing: 32){
                        HStack{
                            Text("Location")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }

                        HStack{
                            Text("Notification")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }
                    }.padding(.horizontal, 32)
                        .padding(.vertical, 16)
                }.background(Color.bkBG)

                VStack{
                    HStack(){
                        Text("Legal")
                            .foregroundColor(Color.bkBrown)
                        Spacer()
                    }.padding(.leading, 32)
                        .padding(.vertical, 16)


                    Divider()
                        .foregroundColor(Color.bkBrown)

                        .padding(.horizontal)
                    VStack (spacing: 32){
                        HStack{
                            Text("Terms of services")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }

                        HStack{
                            Text("Privacy policy")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }
                        HStack{
                            Text("Acknowledgments")
                                .foregroundColor(Color.bkDarkBrown)
                                .flame(font: .regular, size: adaptiveTextSize(size: 16, max: 32))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.bkBrown)
                                .font(.subheadline)
                        }
                    }.padding(.horizontal, 32)
                        .padding(.vertical, 16)
                }.background(Color.bkBG)

                HStack{
                    Text("V6.32.0")
                        .foregroundColor(Color.bkBrown)
                    Spacer()
                }.padding(.horizontal, 32)
                    .padding(.vertical, 16)
                .background(Color.bkBG)

                Spacer()


            }
        }.navigationBarBackButtonHidden()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
