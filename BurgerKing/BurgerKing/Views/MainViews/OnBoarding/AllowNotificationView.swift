//
//  AllowNotificationView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
//

import SwiftUI

struct AllowNotificationView: View {
    @StateObject private var viewModel = AllowNotificationViewModel()
    @State private var showingLocationView = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.bkBG
                        .ignoresSafeArea()

                    VStack(spacing: 16) {
                    Spacer()

                        Image("phone")
                                       .resizable()
                                       .frame(width: geometry.size.width * (0.88), height: geometry.size.height * (0.48))
                                     Spacer()

                        Text("Follow your order")
                            .foregroundColor(Color.bkDarkBrown)
                            .flame(font: .bold, size: adaptiveTextSize(size: 32, max: 48))
                            .multilineTextAlignment(.center)

                        Text("Turn on notifications and get \nupdated when your order is ready. \nOtherwise, you might miss it.")
                            .foregroundColor(Color.bkBrown)
                            .flame(font: .sans, size: adaptiveTextSize(size: 20, max: 24))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 16)
                        CustomButton(title: "Turn on notifications", action: {
                            viewModel.requestNotificationPermission()
                        })
                        .disabled(viewModel.notificationPermissionGranted)
                    }
                }
                .onAppear {
                    viewModel.scheduleLocalNotification()
                }
                .background(
                    Color.clear
                        .onTapGesture {
                            showingLocationView = true
                        }
                )
                .onChange(of: viewModel.notificationPermissionGranted) { granted in
                    if granted {
                        showingLocationView = true
                    }
                }
                .fullScreenCover(isPresented: $showingLocationView, content: AllowLocationView.init)
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the back button
    }


}

struct AllowNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AllowNotificationView()
    }
}
