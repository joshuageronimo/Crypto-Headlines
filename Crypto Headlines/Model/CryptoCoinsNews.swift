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
    let articles: [Articles]
    
    struct Articles: Decodable {
        let title: String
        let url: String
        let urlToImage: String
    }
    
}

struct BingNewsSearch: Decodable {
    let value: [Articles] /* array of news article */
    
    struct Articles: Decodable {
        let name: String /* title of the article */
        let url: String /* url of the article */
        let image: ImageLink? /* url link for the image */
        let description: String /* small summary of the article */
        let provider: [Source]
        
        struct ImageLink: Decodable {
            let contentUrl: String
        }
        
        struct Source: Decodable {
            let name: String /* publisher name */
        }
    }
    
}




