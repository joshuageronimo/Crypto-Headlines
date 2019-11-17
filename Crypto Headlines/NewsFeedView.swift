//
//  NewsFeedView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct NewsFeedView: View {
    
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
                NewsViewModel()
                    .listRowBackground(Color.mainColor)
            }
            .padding(15)
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
