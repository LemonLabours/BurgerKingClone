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
                            .frame(width: geometry.size.width * 0.88, height: geometry.size.height * 0.48)


                        Text("Order at nearby \nrestaurants.")
                            .foregroundColor(Color.bkDarkBrown)
                            .flame(font: .bold, size: adaptiveTextSize(size: 32, max: 48))
                            .multilineTextAlignment(.center)

                        Text("We use your location to show \nnearby restaurants and let you \norder from them.")
                            .foregroundColor(Color.bkBrown)
                            .flame(font: .sans, size: adaptiveTextSize(size: 20, max: 24))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 16)

                        CustomButton(title: "Turn on location", action: {
                            locationViewModel.requestLocationPermission()
                        })
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



