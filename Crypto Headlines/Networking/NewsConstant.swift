//
//  Constant.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/15/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

//https://newsapi.org/v2/top-headlines?sources=crypto-coins-news&apiKey=4280826746c440cba3660dd27cee6ab9

struct NewsConstant {
    
    struct BaseApi {
        static let scheme = "https"
        static let host = "newsapi.org"
        static let path = "v2/top-headlines"
    }
    
    struct MethodParameters {
        static let sources = "sources"
        static let apiKey = "apiKey"
    }
    
    struct MethodValue {
        static let sources = "crypto-coins-news"
        static let apiKey = "4280826746c440cba3660dd27cee6ab9"
    }
}
