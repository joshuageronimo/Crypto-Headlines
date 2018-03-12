//
//  CryptoViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import GoogleMobileAds

class CryptoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITabBarControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var cryptoCurrencies = [CoinMarketCap]()
    fileprivate var pullToRefresh: UIRefreshControl!
    fileprivate let titleCellIdentifier = "TitleCell"
    fileprivate let coinCellIndetifier = "CoinsCell"
    fileprivate var didComeFromAnotherViewController = false
    fileprivate var showInterstitialAd = false
    fileprivate var interstitialAd: GADInterstitial!
    
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
        
        createAndLoadInterstitial() /* get the ad ready */
        createEmptyCellMessage() /* create empty cell UI incase there's an error with the network request. */
        sendNetworkRequest() /* get cryptocurrency prices & info from the API */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // set the tabBarController delegate to this view controller
        self.tabBarController?.delegate = self
        showGoogleInterstialAd()
    }
    
    // will be called when we switch to another view controller
    override func viewWillDisappear(_ animated: Bool) {
        // set this to true, so that when we come back from this view controller
        // the collectionview will not scroll to the top.
        didComeFromAnotherViewController = true
    }
    
    // MARK: Google Admob
    
    // This func will decide whether it will show an insterstitial ad or not.
    // Will only be called in viewWillAppear
    private func showGoogleInterstialAd() {
        let chanceOfAd = arc4random_uniform(3) /* will generate either 0 or 2 */
        if showInterstitialAd { /* if this is true, there's a 25% chance that an ad will show */
            if chanceOfAd == 0 { /* if the generated number is equal to zero then show the ad */
                if interstitialAd.isReady { /* if the ad is ready, show the user! */
                    interstitialAd.present(fromRootViewController: self) /* present the ad! */
                } else {
                    print("Ad wasn't ready")
                }
            }
            didComeFromAnotherViewController = false
            createAndLoadInterstitial() /* get the next ad ready! */
            showInterstitialAd = false /* set this back to false since we are back in NewsViewController from WebView */
        }
    }
    
    // Will get a insterstitial ad ready for the user.
    private func createAndLoadInterstitial() {
        let testID = "ca-app-pub-3940256099942544/4411468910"
        DispatchQueue.main.async {
            self.interstitialAd = GADInterstitial(adUnitID: testID)
            let request = GADRequest()
            // Request test ads on devices you specify. Your test device ID is printed to the console when
            // an ad request is made.
            request.testDevices = [ kGADSimulatorID, "4804ce1f66b692f816baab2372878863"]
            self.interstitialAd.load(request)
        }
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
            showInterstitialAd = true
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
                if cryptoCurrencies.count > 0 {
                    cell.updateCoinFeed(with: cryptoCurrencies[indexPath.item - 1])
                } else {
                    DispatchQueue.main.async {
                        // Update UI
                        self.collectionView.reloadData()
                        self.pullToRefresh.endRefreshing()
                    }
                }
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
            
            // Check if there are any errors
            if error != nil {
                print("Error with network request: \(error!)")
                DispatchQueue.main.async {
                    self.emptyCellErrorMessage.isHidden = false
                    self.reloadEmptyCell.isHidden = false
                }
                return
            } else {
                DispatchQueue.main.async {
                    self.emptyCellErrorMessage.isHidden = true
                    self.reloadEmptyCell.isHidden = true
                }
            }
            
            // check if the response code is good.
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode > 200 {
                    print("Error with network request: \(httpResponse)")
                    return
                }
            }
            
            guard let data = data else {return}
            
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
    
    // MARK - Empty Cell Message
    
    fileprivate let emptyCellErrorMessage: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Uh-oh! Network connection failed. \nPlease try again later."
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.isHidden = true
        return label
    }()
    
    fileprivate let reloadEmptyCell: UIButton! = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Refresh", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.5129698202)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.764494863)
        button.addTarget(self, action: #selector(sendNetworkRequest), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    fileprivate func createEmptyCellMessage() {
        view.addSubview(emptyCellErrorMessage)
        view.addSubview(reloadEmptyCell)
        
        NSLayoutConstraint.activate([
            // Empty Cell message Label constraint
            emptyCellErrorMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyCellErrorMessage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyCellErrorMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            emptyCellErrorMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            //  Empty Cell reload button constraint
            reloadEmptyCell.topAnchor.constraint(equalTo: emptyCellErrorMessage.bottomAnchor, constant: 15),
            reloadEmptyCell.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reloadEmptyCell.heightAnchor.constraint(equalToConstant: 30),
            reloadEmptyCell.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35)])
    }
}
