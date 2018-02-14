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
        let urlString = "https://newsapi.org/v2/top-headlines?sources=crypto-coins-news&apiKey=4280826746c440cba3660dd27cee6ab9"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let json = try JSONDecoder().decode(CryptoCoinsNews.self, from: data)
                for ccn in json.articles {
                    print(ccn)
                }
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }

        }.resume()
    }

}

