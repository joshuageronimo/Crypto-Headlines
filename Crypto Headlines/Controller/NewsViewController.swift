//
//  NewsViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sendNetworkRequest()
    }
    
    private func sendNetworkRequest() {
        // create a session & request
        let session = URLSession.shared
        let request = URLRequest(url: newsApiURL())
        
        // create a network request
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do {
                let json = try JSONDecoder().decode(CryptoCoinsNews.self, from: data)
                for ccn in json.articles {
                    print(ccn)
                }
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
            
            }
        task.resume()
    }
    
    // Create a URL from NewsConstant with URLComponents & URLQueryyItems
    private func newsApiURL() -> URL {
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

