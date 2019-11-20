//
//  NewsViewModel.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct NewsCardRow: View {
    var article: Article
    
    var body: some View {
        ZStack {
            // set background color
            Color.mainColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .fill(Color("accent_dark"))
                        .shadow(radius: 10)
                        .frame(width: nil, height: 100)
                    Text(article.title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.init(top: -40, leading: 10, bottom: 0, trailing: 10))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                }
                NewsThumbNailImageView(imageUrl: article.urlToImage)
            }
            .padding(.top, 15.0)
            .edgesIgnoringSafeArea(.all)
        }

    }
}

struct NewsCardRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardRow(article: Article(title: "Title Here", url: "", urlToImage: "https://www.ccn.com/wp-content/uploads/2019/11/mason-rudolph.jpg"))
    }
}
