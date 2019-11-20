//
//  CryptoCoinsNews.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

// This is the model of the app's news feed.
// This model conforms to the Decodable Protocol
// to be able to parse the JSON data easily.
struct CryptoCoinsNews: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let url: String
    let urlToImage: String
}




