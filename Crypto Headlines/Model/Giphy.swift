//
//  Giphy.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/22/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

struct Giphy: Decodable {
    let data: [Gifs]
    struct Gifs: Decodable {
        let images: ImageFiles
        struct ImageFiles: Decodable {
            let original: GifURL
            struct GifURL: Decodable {
                let url: String
            }
        }
    }
}
