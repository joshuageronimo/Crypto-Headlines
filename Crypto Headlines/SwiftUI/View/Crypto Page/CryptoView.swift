//
//  CryptoView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct CryptoView: View {
    @ObservedObject var cryptoCardVM = CryptoCardViewModel()
    @State fileprivate var cryptoCurrency: CryptoCurrency?
    @State fileprivate var showCryptoDetails = false
    init() {
        setupTableViewAppearance()
    }
    var body: some View {
        ZStack {
            Color.secondaryColor.edgesIgnoringSafeArea(.all)
            
            List {
                TitleHeaderView(mainTitle: Text("Cryptocurrencies"),
                                subTitle: Text("from CoinMarketCap"))
                    .listRowBackground(Color.secondaryColor)
                
                ForEach(self.cryptoCardVM.cryptocurrencies) { crypto in
                    CryptoCardRow(cryptoCurrency: crypto)
                        .listRowBackground(Color.secondaryColor)
                        .onTapGesture {
                            self.cryptoCurrency = crypto
                            self.showCryptoDetails.toggle()
                        }
                }
                
            }
            .padding(.init(top: 15, leading: 10, bottom: 0, trailing: 10))
            .sheet(isPresented: $showCryptoDetails) {
                if self.cryptoCurrency != nil {
                    CryptoDetailsView(crypto: self.cryptoCurrency!)
                }

                
            }
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
