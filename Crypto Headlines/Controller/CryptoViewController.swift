//
//  CryptoViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class CryptoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITabBarControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var cryptoCurrencies = [CoinMarketCap]()
    fileprivate var pullToRefresh: UIRefreshControl!
    fileprivate let titleCellIdentifier = "TitleCell"
    fileprivate let coinCellIndetifier = "CoinsCell"
    fileprivate var didComeFromAnotherViewController = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: titleCellIdentifier)
        collectionView.register(CoinsCollectionViewCell.self, forCellWithReuseIdentifier: coinCellIndetifier)
        
        // implement pull to refresh feature
        pullToRefresh = UIRefreshControl()
        pullToRefresh.addTarget(self, action: #selector(sendNetworkRequest), for: .valueChanged)
        collectionView.addSubview(pullToRefresh)
        
        sendNetworkRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // set the tabBarController delegate to this view controller
        self.tabBarController?.delegate = self
    }
    
    // will be called when we switch to another view controller
    override func viewWillDisappear(_ animated: Bool) {
        // set this to true, so that when we come back from this view controller
        // the collectionview will not scroll to the top.
        didComeFromAnotherViewController = true
    }
    
    // This function will allow tapping the the tab bar item to scroll to the top.
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // if we did not come straight from another View Controller, user will be able to tap to scroll to the top.
        if !didComeFromAnotherViewController {
            self.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        } else {
            // else will be called when the user presses to go back to this page
            // set the didComeFromAnotherViewController back to false.
            didComeFromAnotherViewController = false
        }
    }
    
    
    // This function notifies the view controller that a segue is about to be performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toNavigationController = segue.destination as? UINavigationController {
            let toCryptoViewController = toNavigationController.viewControllers.first as! CryptoInfoViewController
            toCryptoViewController.updateCryptoData(from: sender as! CoinMarketCap)
        }
    }
    
    // MARK - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cryptoCurrencies.count + 1 /* add 1 for the title cell */
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 { /* Show the Title Header in index 0 */
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleCellIdentifier, for: indexPath) as? TitleCollectionViewCell {
                if let pageIndex = self.tabBarController?.selectedIndex {
                    cell.updateHeader(title: HeaderSource.instance.array[pageIndex])
                }
                return cell
            } else {
                return TitleCollectionViewCell()
            }
        } else { /* Show the news feed after index 0 */
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: coinCellIndetifier, for: indexPath) as? CoinsCollectionViewCell {
                cell.updateCoinFeed(with: cryptoCurrencies[indexPath.item - 1])
                return cell
            } else {
                return CoinsCollectionViewCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCoinDetail", sender: cryptoCurrencies[indexPath.item - 1])
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
    
    @objc fileprivate func sendNetworkRequest() {
        // create a session & request
        let session = URLSession.shared
        let request = URLRequest(url: apiURL())

        // create a network request
        let task = session.dataTask(with: request) { (data, response, error) in
            // Initialize cryptoCurrencies array to zero
            // So when pullToRefresh is called
            // & the same coins load up from JSON
            // It wont duplicate the coins in the coin feed.
            self.cryptoCurrencies = []
            guard let data = data else {return}
            
            // check if there are any errors
            if error != nil {
                print("Error with network request: \(error!)")
                return
            }
            
            // check if the response code is good.
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode > 200 {
                    print("Error with network request: \(httpResponse)")
                    return
                }
            }
            
            // Decode the JSON data that we recieved from the API
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
                self.pullToRefresh.endRefreshing()
            }
        }
        task.resume()
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
