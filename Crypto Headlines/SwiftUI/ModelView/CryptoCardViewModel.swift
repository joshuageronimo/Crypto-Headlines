//
//  CryptoCardViewModel.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI
import Combine


class CryptoCardViewModel: ObservableObject {
    
    @Published var cryptocurrencies = [CryptoCurrency]()
    
    init() {
        fetchCryptoData()
    }
    
    fileprivate func fetchCryptoData() {
        NetworkService.shared.fetchData(urlString: "\(apiURL())") { (data: [CryptoCurrency]?, error: Error?) in
            guard let cryptocurrencies = data else { return }
            DispatchQueue.main.async {
                self.cryptocurrencies = cryptocurrencies
            }
        }
    }

    // Create a URL from NewsConstant with URLComponents & URLQueryyItems
    fileprivate func apiURL() -> URL {
        // Construct Base Api
        var components = URLComponents()
        components.scheme = CoinsConstant.BaseApi.scheme
        components.host = CoinsConstant.BaseApi.host
        components.path = CoinsConstant.BaseApi.path
        return components.url!
    }

}
