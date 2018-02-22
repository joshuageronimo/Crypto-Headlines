//
//  GiphyConstant.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/22/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation

// https://api.giphy.com/v1/gifs/search?api_key=hgCAt3yUZMijOECTcvFsD9CU8NWE5jAB&q=yay&limit=25&lang=en

struct GiphyConstant {
    struct BaseApi {
        static let scheme = "https"
        static let host = "api.giphy.com"
        static let path = "/v1/gifs/search"
    }
    
    struct MethodParameters {
        static let apiKey = "api_key"
        static let query = "q"
        static let limit = "limit"
        static let language = "lang"
    }
    
    struct MethodValues {
        static let apiKey = "hgCAt3yUZMijOECTcvFsD9CU8NWE5jAB"
        static let query = "yay"
        static let limit = "25"
        static let language = "en"
    }
}
