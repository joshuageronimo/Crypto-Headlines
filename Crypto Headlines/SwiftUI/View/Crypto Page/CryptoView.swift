//
//  CryptoView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct CryptoView: View {
    init() {
        setupTableViewAppearance()
    }
    var body: some View {
        ZStack {
            Color.secondaryColor
            .edgesIgnoringSafeArea(.all)
            
            List {
                TitleHeaderView(mainTitle: Text("Cryptocurrencies"),
                                subTitle: Text("from CoinMarketCap"))
                .listRowBackground(Color.secondaryColor)
                
                CryptoRow()
                    .listRowBackground(Color.secondaryColor)
            }
            .padding(.init(top: 15, leading: 10, bottom: 0, trailing: 10))
        }
    }
    
    fileprivate func setupTableViewAppearance() {
        UITableView.appearance().backgroundColor = UIColor.secondaryColor
        UITableView.appearance().separatorStyle = .none
    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView()
    }
}
