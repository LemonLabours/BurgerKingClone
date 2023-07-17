//
//  StartView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 08/07/2023.
//
import SwiftUI

struct StartView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @StateObject private var viewModel = StartViewModel()

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.bkBG
                        .ignoresSafeArea()

                    VStack(spacing: verticalSizeClass == .compact ? 8 : 16) {
                        Spacer()

                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: min(geometry.size.width * 0.6, verticalSizeClass == .compact ? 220 : 300))
                            .padding(.bottom, 54)

                        Text("The easiest way\nto order")
                            .foregroundColor(Color.bkDarkBrown)
                            .flame(font: .bold, size: adaptiveTextSize(size: 36, max: 48))
                            .multilineTextAlignment(.center)

                        Text("No lines. No waiting.")
                            .foregroundColor(Color.bkDarkBrown)
                            .font(.headline)

                        VStack {
                            Text("By proceeding you confirm that you have read our ")
                                .foregroundColor(Color.bkBrown)
                                .flame(font: .sans, size: adaptiveTextSize(size: 14, max: 24))
                            NavigationLink(destination: PrivacyPolicyView()) {
                                Text("privacy policy")
                                    .underline()
                                    .foregroundColor(Color.bkDarkBrown)
                                    .flame(font: .regular, size: adaptiveTextSize(size: 14, max: 24))
                            }
                        }
                        .padding(8)

                        CustomButton(title: "Let's Start") {
                            viewModel.handleLetsStartButtonTapped()
                        }
                        .fullScreenCover(isPresented: $viewModel.showingNotificationView) {
                            AllowNotificationView()
                        }
                    }
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
