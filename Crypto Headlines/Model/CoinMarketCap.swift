//
//  CoinMarketCap.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/18/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

// This is the model of the app's coin feed.
// This model conforms to the Decodable Protocol
// to be able to parse the JSON data easily.
struct CoinMarketCap: Decodable {
    let name: String
    let symbol: String
    let rank: String
    let price_usd: String
    let market_cap_usd: String
    let percent_change_1h: String
    let percent_change_24h: String
    let percent_change_7d: String
}
