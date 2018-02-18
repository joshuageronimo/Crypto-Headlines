//
//  CryptoViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class CryptoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    private var cryptoCurrencies = [CoinMarketCap]()
    private let tabBarPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCell")
        collectionView.register(CoinsCollectionViewCell.self, forCellWithReuseIdentifier: "CoinsCell")
        
        sendNetworkRequest()
    }
    
    // MARK - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cryptoCurrencies.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 { /* Show the Title Header in index 0 */
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as? TitleCollectionViewCell {
                cell.updateHeader(title: HeaderSource.instance.array[tabBarPage])
                return cell
            } else {
                return TitleCollectionViewCell()
            }
        } else { /* Show the news feed after index 0 */
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinsCell", for: indexPath) as? CoinsCollectionViewCell {
                cell.updateCoinFeed(with: cryptoCurrencies[indexPath.item - 1])
                return cell
            } else {
                return CoinsCollectionViewCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 { /* return the cell size for the Header Title */
            return CGSize(width: view.frame.width, height: view.frame.height / 10)
        } else { /* return the cell size for the feed */
            return CGSize(width: view.frame.width, height: view.frame.height / 8)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // MARK - Networking
    
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
                for coins in json {
                    self.cryptoCurrencies.append(coins)
                }
                
            } catch let jsonErr {
                print("Error serializing json", jsonErr)
            }
            DispatchQueue.main.async {
                // Update UI
                self.collectionView.reloadData()
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
