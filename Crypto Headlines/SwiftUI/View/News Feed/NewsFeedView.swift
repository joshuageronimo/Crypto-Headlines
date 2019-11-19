//
//  NewsFeedView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct NewsFeedView: View {
    
    @ObservedObject var newsCardViewModel = NewsCardViewModel()
    @State fileprivate var urlOfArticleToView = ""
    @State fileprivate var showArticle = false
    
    init() {
        setupTableViewAppearance()
    }
    
    var body: some View {
        ZStack {
            // set background color
            Color.mainColor.edgesIgnoringSafeArea(.all)
               
            List {
                TitleHeaderView(mainTitle: Text("Current Headlines"),
                                subTitle: Text("from CryptoCoinsNews"))
                    .listRowBackground(Color.mainColor)
                
                ForEach(self.newsCardViewModel.cryptoCoinsNews) { article in
                    NewsCardRow(article: article)
                    .listRowBackground(Color.mainColor)
                    .onTapGesture {
                        self.urlOfArticleToView = article.url
                        self.showArticle.toggle()
                    }
                }
            }
            .padding(.init(top: 15, leading: 10, bottom: 0, trailing: 10))
            .sheet(isPresented: $showArticle) {
                ArticleView(url: self.urlOfArticleToView)
            }
        }
    }
    
    fileprivate func setupTableViewAppearance() {
        UITableView.appearance().backgroundColor = UIColor.mainColor
        UITableView.appearance().separatorStyle = .none
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
