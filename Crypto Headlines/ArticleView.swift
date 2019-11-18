//
//  ArticleView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    @Environment(\.presentationMode) var presentation
    var url: String

    var body: some View {
        NavigationView {
            WebView(url: url)
                .navigationBarTitle(Text("CCN"), displayMode: .inline)
                .navigationBarItems(trailing:
                    Button("Dismiss") {
                        self.presentation.wrappedValue.dismiss()
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("primary_dark")/*@END_MENU_TOKEN@*/)
            )
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(url: "https://www.google.com")
    }
}
