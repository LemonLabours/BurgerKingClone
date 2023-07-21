//
//  AuthenticationSheet.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 21/07/2023.
//
import SwiftUI


struct AuthenticationSheet: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.bkBG
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 16) {
                        Text("Create account or sign in to proceed")
                            .foregroundColor(Color.bkBrown)
                            .font(.subheadline)
                        Button(action: {
                            // Handle Facebook sign-in action here
                        }) {
                            HStack {
                                Image("facebook-white")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("Continue with Facebook")
                                    .foregroundColor(Color.white)
                                    .flame(font: .regular, size: adaptiveTextSize(size: 22, max: 32))
                            }
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity) // Set the width to infinity
                            .background(Color.blue)
                            .cornerRadius(8)
                        }

                        Button(action: {
                            // Handle Apple sign-in action here
                        }) {
                            HStack {
                                Image(systemName: "applelogo")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                Text("Continue with Apple")
                                    .foregroundColor(Color.white)
                                    .flame(font: .regular, size: adaptiveTextSize(size: 22, max: 32))
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity) // Set the width to infinity
                            .background(Color.black)
                            .cornerRadius(8)
                        }

                        Button(action: {
                            // Handle email sign-in action here
                        }) {
                            HStack {
                                Text("Continue with Email")
                                    .foregroundColor(Color.white)
                                    .flame(font: .regular, size: adaptiveTextSize(size: 22, max: 32))
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity) // Set the width to infinity
                            .background(Color.bkRed)
                            .cornerRadius(8)
                        }

                        VStack(spacing: 3) {
                            HStack(spacing: 3) {
                                Text("By proceeding, you accept our")
                                    .foregroundColor(Color.bkBrown)
                                    .font(.caption2)

                                NavigationLink(destination: TermsOfServiceView()) {
                                    Text("Terms of service")
                                        .underline()
                                        .foregroundColor(Color.bkDarkBrown)
                                        .flame(font: .regular, size: 10)
                                }
                            }

                            HStack(spacing: 3) {
                                Text("and confirm that you have read our")
                                    .foregroundColor(Color.bkBrown)
                                    .font(.caption2)

                                NavigationLink(destination: PrivacyPolicyView()) {
                                    Text("Privacy policy")
                                        .underline()
                                        .foregroundColor(Color.bkDarkBrown)
                                        .flame(font: .regular, size: 10)
                                }
                            }
                        }

                        Spacer()
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                }
            }
        }
    }
}

struct AuthenticationSheet_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationSheet()
    }
}
