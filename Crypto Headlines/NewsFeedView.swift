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
    
    init() {
        setupTableViewAppearance()
    }
    
    var body: some View {
        ZStack {
            // set background color
            Color.mainColor
                .edgesIgnoringSafeArea(.all)
               
            List {
                TitleHeaderView(mainTitle: Text("Current Headlines"),
                                subTitle: Text("from CryptoCoinsNews"))
                    .listRowBackground(Color.mainColor)
                ForEach(self.newsCardViewModel.cryptoCoinsNews) { article in
                    NewsCardRow(title: Text(article.title), imageURL: article.urlToImage)
                                       .listRowBackground(Color.mainColor)
                }
            }
            .padding(.init(top: 15, leading: 10, bottom: 0, trailing: 10))
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
