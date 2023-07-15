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

                    VStack(spacing: 20) {
                        Spacer()

                        Image("phone")
                            .resizable()
                            .frame(width: geometry.size.width * (0.64), height: geometry.size.height * (0.32))
                            .padding(.bottom , 78)

                        Text("Follow your order")
                            .foregroundColor(Color.bkDarkBrown)
                            .flame(font: .bold, size: 36)
                            .multilineTextAlignment(.center)

                        Text("Turn on notifications and get \nupdated when your order is ready. \nOtherwise, you might miss it.")
                            .foregroundColor(Color.bkDarkBrown)
                            .font(.title2)
                            .multilineTextAlignment(.center)

                        Spacer()
                            .frame(height: 10)

                        Button(action: {
                            viewModel.requestNotificationPermission()
                        }) {
                            Text("Turn on notifications")
                                .flame(font: .regular, size: 32)
                                .frame(width: geometry.size.width * 0.9, height: 72)
                                .background(Color.bkRed)
                                .foregroundColor(.white)
                                .cornerRadius(22)
                        }
                        .padding(.bottom, 32)
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
