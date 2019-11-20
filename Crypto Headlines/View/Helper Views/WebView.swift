//
//  WebView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        // no need to implement anything here at this point
    }

}
