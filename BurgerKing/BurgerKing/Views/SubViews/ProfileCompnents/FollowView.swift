//
//  FollowView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 18/07/2023.
//

import SwiftUI

struct FollowView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode
    var body: some View {
        
        ZStack{
            Color.bkDarkBG
                .ignoresSafeArea()
            
            
            VStack {
                CustomNavigationBar(title: "Follow BK", presentationMode: presentationMode)
                Spacer()
                
                VStack{
                    HStack{
                        // Image()
                        Text()
                        Button{
                            
                        }label: {
                            Image()
                        }
                    }
                    
                    
                }
            }
        }
    }
}
struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        FollowView()
    }
}
