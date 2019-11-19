//
//  CryptoCardRow.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct CryptoCardRow: View {
    fileprivate let screenHeight = UIScreen.main.bounds.height
    fileprivate let screenWidth = UIScreen.main.bounds.width
    
    var cryptoCurrency: CryptoCurrency
    
    var body: some View {
        ZStack {
            Color.secondaryColor.edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.mainColor)
                .frame(width: nil, height: screenHeight * 0.17, alignment: .center)
                .shadow(radius: 10)
            HStack() {
                // Rank # & Currency Symbol
                VStack(alignment: .leading, spacing: 5) {
                    Text("#\(cryptoCurrency.rank)")
                        .foregroundColor(.lightAccentColor)
                        .fontWeight(.medium)
                    Text(cryptoCurrency.symbol)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }.padding(.init(top: 0, leading: 25, bottom: 0, trailing: 0))
                Spacer()
                // Currency Price Status
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(self.convertToCurrency(cryptoCurrency.price_usd))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .minimumScaleFactor(0.7)
                            .lineLimit(1)
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                        Spacer()
                            
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Text("Past Day")
                            .foregroundColor(.lightAccentColor)
                            .multilineTextAlignment(.leading)
                        if cryptoCurrency.percent_change_24h.contains("-") {
                            Text("(\(cryptoCurrency.percent_change_24h))")
                                .foregroundColor(.negativeColor)
                                .fontWeight(.medium)
                        } else {
                            Text("(\(cryptoCurrency.percent_change_24h))")
                                .foregroundColor(.positiveColor)
                                .fontWeight(.medium)
                        }
                    }
                }
                .frame(width: screenWidth * 0.37, height: nil)
                .padding(.init(top: 0, leading: 1, bottom: 0, trailing: 20))
            }
        }
        .padding(.top, 15)

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
}

struct CryptoCardRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CryptoCardRow(cryptoCurrency: CryptoCurrency(name: "Bitcoin",
                                                         symbol: "BTC",
                                                         rank: "1",
                                                         price_usd: "1230.00",
                                                         market_cap_usd: "",
                                                         available_supply: "",
                                                         total_supply: "",
                                                         max_supply: nil,
                                                         percent_change_1h: "2.8",
                                                         percent_change_24h: "2.8",
                                                         percent_change_7d: nil))
                .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                                      height: UIScreen.main.bounds.height * 0.17))
            
            CryptoCardRow(cryptoCurrency: CryptoCurrency(name: "Litecoin",
                                                     symbol: "LTC",
                                                     rank: "2",
                                                     price_usd: "122.00",
                                                     market_cap_usd: "",
                                                     available_supply: "",
                                                     total_supply: "",
                                                     max_supply: nil,
                                                     percent_change_1h: "2.8",
                                                     percent_change_24h: "-2.8",
                                                     percent_change_7d: nil))
            .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                                  height: UIScreen.main.bounds.height * 0.17))
            
            CryptoCardRow(cryptoCurrency: CryptoCurrency(name: "XYZ",
                                                     symbol: "XYZ",
                                                     rank: "3",
                                                     price_usd: "0.000000",
                                                     market_cap_usd: "",
                                                     available_supply: "",
                                                     total_supply: "",
                                                     max_supply: nil,
                                                     percent_change_1h: "2.8",
                                                     percent_change_24h: "2.8",
                                                     percent_change_7d: nil))
            .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                                  height: UIScreen.main.bounds.height * 0.17))
        }
    }
}
