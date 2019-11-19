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
                    CryptoCardRow(rankNumber: Text("#\(crypto.rank)"),
                                  cryptoSymbol: Text(crypto.symbol),
                                  price: Text(self.convertToCurrency(crypto.price_usd)),
                                  status: crypto.percent_change_24h.contains("-") ? Text("(\(crypto.percent_change_24h))").foregroundColor(.negativeColor) : Text("(\(crypto.percent_change_24h))"))
                    .listRowBackground(Color.secondaryColor)
                }
                
            }
            .padding(.init(top: 15, leading: 10, bottom: 0, trailing: 10))
        }
    }
    
    // This function will convert a number into currency format
    fileprivate func convertToCurrency(_ number: String) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        let numberDouble = Double(number)!
        if numberDouble >= 10 {
            //numberString = convertToCurrency(number: numberDouble)
            let priceOfCoin: NSNumber = numberDouble as NSNumber
            let priceString = currencyFormatter.string(from: priceOfCoin)!
            return priceString
        }
        return "$\(number)"
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
