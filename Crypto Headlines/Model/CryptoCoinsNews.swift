//
//  CryptoCoinsNews.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

struct CryptoCoinsNews: Decodable {
    let articles: [Articles]
}

struct Articles: Decodable {
    let title: String
    let url: String
    let urlToImage: String
}
