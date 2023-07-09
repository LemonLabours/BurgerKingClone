//
//  TabView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 09/07/2023.
import SwiftUI
struct MainTabView: View {
    @State private var selection = 0

    var body: some View {
        VStack {
            Spacer()

            switch selection {
            case 0: HomeView()
            case 1: OrderView()
            case 2: OffersView()
            case 3: ProfileView()
            default: HomeView()
            }

            Spacer()

            HStack {
                Button(action: { selection = 0 }) {
                    VStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(selection == 0 ? .bkRed : .bkDarkBrown)
                            .font(.title)
                        Text("Home")
                            .foregroundColor(selection == 0 ? .bkRed : .bkDarkBrown)
                    }
                }

                Spacer()

                Button(action: { selection = 1 }) {
                    VStack {
                        Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                            .foregroundColor(selection == 1 ? .bkRed : .bkDarkBrown)
                            .font(.title)
                        Text("Order")
                            .foregroundColor(selection == 1 ? .bkRed : .bkDarkBrown)
                    }
                }

                Spacer()

                Button(action: { selection = 2 }) {
                    VStack {
                        Image(systemName: "tag.fill")
                            .foregroundColor(selection == 2 ? .bkRed : .bkDarkBrown)
                            .font(.title)
                        Text("Offers")
                            .foregroundColor(selection == 2 ? .bkRed : .bkDarkBrown)
                    }
                }

                Spacer()

                Button(action: { selection = 3 }) {
                    VStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(selection == 3 ? .bkRed : .bkDarkBrown)
                            .font(.title)
                        Text("Profile")
                            .foregroundColor(selection == 3 ? .bkRed : .bkDarkBrown)
                    }
                }
            }
            .padding(.horizontal)
        }.padding()
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
