//
//  CryptoViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class CryptoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sendNetworkRequest()
    }
    
    private func sendNetworkRequest() {
        
        // TODO -  Check for error and response
        
        // create a session & request
        let session = URLSession.shared
        let request = URLRequest(url: apiURL())
        
        // create a network request
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do {
                let json = try JSONDecoder().decode([CoinMarketCap].self, from: data)
                
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
        }
        task.resume()
    }
    
    // Create a URL from NewsConstant with URLComponents & URLQueryyItems
    private func apiURL() -> URL {

        // this is a dictionary of methods and value parameters of the url query
        let urlQueryParameters: [String : AnyObject] = [
            CoinsConstant.MethodParameters.limit : CoinsConstant.ValueParameter.limit as AnyObject
        ]
        
        // Construct Base Api
        var components = URLComponents()
        components.scheme = CoinsConstant.BaseApi.scheme
        components.host = CoinsConstant.BaseApi.host
        components.path = CoinsConstant.BaseApi.path
        
        // Construct Query
        components.queryItems = [URLQueryItem]()
        for (key, value) in urlQueryParameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
}
