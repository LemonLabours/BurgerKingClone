//
//  AllowLocationView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 07/07/2023.
import SwiftUI

struct AllowLocationView: View {
    @EnvironmentObject private var locationViewModel: AllowLocationViewModel
    @State private var showPermissionAlert = false
    @State private var navigateToTabView = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.bkBG
                        .ignoresSafeArea()

                    VStack(spacing: 20) {
                        Spacer()

                        Image("location")
                            .resizable()
                            .frame(width: geometry.size.width * (0.64), height: geometry.size.height * (0.32))
                            .padding(.bottom, 78)

                        Text("Order at nearby \nrestaurants.")
                            .foregroundColor(Color.bkDarkBrown)
                            .flame(font: .bold, size: 36)
                            .multilineTextAlignment(.center)

                        Text("We use your location to show \nnearby restaurants and let you \norder from them.")
                            .foregroundColor(Color.bkDarkBrown)
                            .font(.title2)
                            .multilineTextAlignment(.center)

                        Spacer()
                            .frame(height: 10)

                        Button(action: {
                            locationViewModel.requestLocationPermission()
                        }) {
                            Text("Turn on location")
                                .flame(font: .regular, size: 32)
                                .frame(width: geometry.size.width * 0.9, height: 72)
                                .background(Color.bkRed)
                                .foregroundColor(.white)
                                .cornerRadius(22)
                        }
                        .padding(.bottom, 32)
                        .disabled(locationViewModel.permissionStatus != .notDetermined)
                    }
                }
            }
            .onReceive(locationViewModel.$permissionStatus) { permissionStatus in
                if permissionStatus == .authorized {
                    showPermissionAlert = false
                    navigateToTabView = true
                } else if permissionStatus == .denied {
                    showPermissionAlert = true
                }
            }
            .alert(isPresented: $showPermissionAlert) {
                Alert(
                    title: Text("Location Permission Denied"),
                    message: Text("Please enable location permission in Settings to use this feature."),
                    primaryButton: .default(Text("Open Settings"), action: openSettings),
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
            .background(
                NavigationLink(
                    destination: MainTabView(),
                    isActive: $navigateToTabView,
                    label: { EmptyView() }
                )
                .hidden()
            )
            .navigationBarHidden(true)
        }
    }

    private func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(settingsURL)
    }
}

struct AllowLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AllowLocationView()
            .environmentObject(AllowLocationViewModel())
    }
}
