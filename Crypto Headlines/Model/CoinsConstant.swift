//
//  CoinsConstant.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/18/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

//"https://api.coinmarketcap.com/v1/ticker/?limit=10"

struct CoinsConstant {
    struct BaseApi {
        static let scheme = "https"
        static let host = "api.coinmarketcap.com"
        static let path = "/v1/ticker"
    }
    
    struct MethodParameters {
        static let limit = "limit"
    }
    
    struct ValueParameter {
        static let limit = "10"
    }
}
