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
        UITableView.appearance().backgroundColor = UIColor.mainColor
        UITableView.appearance().separatorStyle = .none
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
            }
            .padding(15)
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
