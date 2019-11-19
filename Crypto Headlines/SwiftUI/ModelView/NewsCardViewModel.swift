//
//  NewsCardViewModel.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI
import Combine


class NewsCardViewModel: ObservableObject {
    @Published var cryptoCoinsNews = [Article]()
    
    init() {
        fetchNewsData()
    }
    
    fileprivate func fetchNewsData() {
        NetworkService.shared.fetchData(urlString: "\(apiURL())") { (data: CryptoCoinsNews?, error: Error?) in
            guard let articles = data?.articles else { return }
            DispatchQueue.main.async {
                self.cryptoCoinsNews = articles
            }
        }
    }
    
    // Create a URL from NewsConstant with URLComponents & URLQueryyItems
    private func apiURL() -> URL {
        // this is a dictionary of methods and value parameters of the url query
        let urlQueryParameters: [String : AnyObject] = [
            NewsConstant.MethodParameters.sources : NewsConstant.MethodValue.sources as AnyObject,
            NewsConstant.MethodParameters.apiKey : NewsConstant.MethodValue.apiKey as AnyObject
        ]
        
        // Construct Base Api
        var components = URLComponents()
        components.scheme = NewsConstant.BaseApi.scheme
        components.host = NewsConstant.BaseApi.host
        components.path = NewsConstant.BaseApi.path
        
        // Construct Query
        components.queryItems = [URLQueryItem]()
        for (key, value) in urlQueryParameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
}
