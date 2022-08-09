//
//  WebView.swift
//  H4XOR News
//
//  Created by Kim Yewon on 2022/08/09.
//

import Foundation
import WebKit
import SwiftUI

// UIViewRepresentable : Allow UIKit in SwiftUI
struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let urlString = urlString else { return }
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
