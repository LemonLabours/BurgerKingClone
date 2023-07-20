//
//  AcknowledgementsView.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 18/07/2023.
//
import SwiftUI

struct AcknowledgementsView: View {
    @Environment(\.presentationMode) var presentationMode // Get the presentationMode

    var body: some View {
        ZStack {
            Color.bkBG
                .ignoresSafeArea()
            VStack {
                CustomNavigationBar(title: "Acknowledgements", presentationMode: presentationMode)

                ScrollView {
                    Text("The following set forth attribution notices are for third party software that may be contained in portions of the MENU applications. We thank the open source community for all of their contributions.")
                        .foregroundColor(.bkGray)
                        .padding()

                    HStack {
                        Text("1. CardIo (\n http://card.io )")
                            .font(.title)
                        Spacer()
                    }
                    .padding()

                    Text("card.io\nsiOS SDK uses code from the following libraries with gratitude!:\nWillow Garage's OpenCV\nEigen\nErica Sadun's iPhone Developer's\nCookbook Code Samples and uidevice-extension categories\nGeorg Kitz's UIDevice-with-Uniqueldentifier-for-iOS-5\nTomás Znamenácek's Lambda Alert\nJosh Bleecher Snyder's TLCommon\nOpenstack")

                        .foregroundColor(Color.bkGray)
                    HStack {
                        Text("1.1 Eigen")
                            .font(.title)
                        Spacer()
                    }
                    .padding()

                    Text("MPLv2 license text can be found at www.mozilla.org/MPLthe source code is available at \nhttps://bitbucket.org/eigen/eigen/ \nor via\nhttp://eigen.tuxfamily.org")
                        .font(.headline)
                        .foregroundColor(Color.bkGray)

                    HStack {
                        Text("1.2 Erica Sadun's code,BSD license")
                            .font(.title)
                        Spacer()

                    }
                    .padding()


                    Text("Copyright (c) 2012, Erica Sadun All rights reserved.\nRedistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:")
                        .foregroundColor(Color.bkGray)
                    Text("Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.\nRedistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS AS IS AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY @E SLICH DAMAGE.")
                        .foregroundColor(Color.bkGray)
                        .padding(.top)

                }.multilineTextAlignment(.leading)
                .padding(.all, 24)
                .background()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AcknowledgementsView_Previews: PreviewProvider {
    static var previews: some View {
        AcknowledgementsView()
    }
}
