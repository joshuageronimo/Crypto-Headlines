//
//  CryptoDetailsView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct CryptoDetailsView: View {
    @Environment(\.presentationMode) var presentation
    var crypto: CryptoCurrency
    
    var body: some View {
        NavigationView {
            ZStack {
                // set background color
                Color.secondaryColor.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 10) {
                        Text(crypto.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        Text(crypto.symbol)
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.lightAccentColor)
                        Divider()
                            .background(Color.white)
                            .frame(width: nil, height: 1, alignment: .center)
                            .padding(.init(top: 5, leading: 0, bottom: 20, trailing: 0))
                    }
                    
                    // INFO STACK
                    VStack(spacing: 15) {
                        CryptoInfoView(itemTitle: Text("Rank:"),
                                       itemInfo: Text("#\(crypto.rank)"))

                        CryptoInfoView(itemTitle: Text("Market Cap:"),
                                       itemInfo: Text(crypto.market_cap_usd))

                        CryptoInfoView(itemTitle: Text("Current Price:"),
                                       itemInfo: Text(crypto.price_usd))

                        CryptoInfoView(itemTitle: Text("Available Supply:"),
                                       itemInfo: Text(crypto.available_supply))

                        CryptoInfoView(itemTitle: Text("Total Supply:"),
                                       itemInfo: Text(crypto.total_supply))

                        CryptoInfoView(itemTitle: Text("Max Supply:"),
                                       itemInfo: Text(crypto.max_supply ?? "N/A"))
                        
                        CryptoInfoView(itemTitle: Text("Percent Changein 1hr:"),
                                       itemInfo: crypto.percent_change_1h.contains("-") ?
                                        Text(crypto.percent_change_1h).foregroundColor(.negativeColor) :
                                        Text(crypto.percent_change_1h).foregroundColor(.positiveColor))
                        
                        CryptoInfoView(itemTitle: Text("Percent Changein 24hr:"),
                        itemInfo: crypto.percent_change_24h.contains("-") ?
                        Text(crypto.percent_change_24h).foregroundColor(.negativeColor) :
                        Text(crypto.percent_change_24h).foregroundColor(.positiveColor))
                    
                        CryptoInfoView(itemTitle: Text("Percent Changein 7 days:"),
                                       itemInfo: (crypto.percent_change_7d ?? "N/A").contains("-") ? Text(crypto.percent_change_7d ?? "N/A").foregroundColor(.negativeColor) :
                                        Text(crypto.percent_change_7d ?? "N/A").foregroundColor(.positiveColor))

                        
                        
                        Divider()
                        .background(Color.white)
                        .frame(width: nil, height: 1, alignment: .center)
                        .padding(.init(top: 15, leading: 0, bottom: 20, trailing: 0))
                    }

                }
                .padding(25)
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(trailing:
                    Button("Dismiss") {
                        self.presentation.wrappedValue.dismiss()
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("primary_dark")/*@END_MENU_TOKEN@*/)
                )
            }
        }
    }
}

// MARK: INFO TEXT UI VIEW

struct CryptoInfoView: View {
    fileprivate var itemTitle: Text
    fileprivate var itemInfo: Text
    var body: some View {
        HStack {
            itemTitle
                .foregroundColor(.lightAccentColor)
            itemInfo
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct CryptoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetailsView(crypto: CryptoCurrency(name: "Bitcoin",
                                                 symbol: "BTC",
                                                 rank: "1",
                                                 price_usd: "$7,879.00",
                                                 market_cap_usd: "$1,123,123,123,123",
                                                 available_supply: "1,123,123,123,123",
                                                 total_supply: "1,123,123,123,123",
                                                 max_supply: "1,123,123,123,123",
                                                 percent_change_1h: "-1.2",
                                                 percent_change_24h: "2.6",
                                                 percent_change_7d: "5.45"))
    }
}
