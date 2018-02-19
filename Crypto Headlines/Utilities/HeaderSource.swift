//
//  HeaderSource.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

class HeaderSource {
    static let instance = HeaderSource()
    
    private let titleArray: [TitleHeader] = [
        TitleHeader(headerTitle: "Current Headlines", subTitle: "from CryptoCoinsNews"),
        TitleHeader(headerTitle: "Cryptocurrencies", subTitle: "from CoinMarketCap"),
        TitleHeader(headerTitle: "GeronimoApp", subTitle: "developer page")]
    
    var array: [TitleHeader] {
        get {
            return titleArray
        }
    }
}
