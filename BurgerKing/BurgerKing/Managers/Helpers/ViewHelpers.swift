//
//  ViewHelpers.swift
//  BurgerKing
//
//  Created by Lama AL Yousef on 17/07/2023.
//

import Foundation
import SwiftUI
import WebKit

func adaptiveTextSize(size: CGFloat, max: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    let scaledSize = screenWidth / 375.0 * size
    return min(scaledSize, max)
}



struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update the view if needed
    }
}
