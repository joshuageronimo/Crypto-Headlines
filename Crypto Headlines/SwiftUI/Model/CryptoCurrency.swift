//
//  CryptoCurrency.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/18/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

// This is the model of the app's coin feed.
// This model conforms to the Decodable Protocol
// to be able to parse the JSON data easily.
struct CryptoCurrency: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let rank: String
    let price_usd: String
    let market_cap_usd: String
    let available_supply: String
    let total_supply: String
    let max_supply: String?
    let percent_change_1h: String
    let percent_change_24h: String
    let percent_change_7d: String?
    
    // This function will convert a number into currency format
    func getFormattedCryptoUSDPrice() -> String {
        return formatToUSD(price_usd)
    }
    
    func getFormattedMarketCapUSDPrice() -> String {
        return formatToUSD(market_cap_usd)
    }
    
    fileprivate func formatToUSD(_ unformattedString: String) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        let numberDouble = Double(unformattedString)!
        if numberDouble >= 10 {
            //numberString = convertToCurrency(number: numberDouble)
            let priceOfCoin: NSNumber = numberDouble as NSNumber
            let priceString = currencyFormatter.string(from: priceOfCoin)!
            return priceString
        }
        return "$\(unformattedString)"
    }
    

}
