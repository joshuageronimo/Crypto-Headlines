//
//  NewsViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import GoogleMobileAds

class NewsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITabBarControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var newsArticles = [CryptoCoinsNews.Articles]()
    fileprivate var pullToRefresh: UIRefreshControl!
    fileprivate let titleCellIdentifier = "TitleCell"
    fileprivate let newsCellIndetifier = "NewsCell"
    fileprivate var didComeFromAnotherViewController = false
    
    fileprivate var showInterstitialAd = false
    fileprivate var interstitialAd: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the collection view delegate and datasource to the view controller
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register the custom cells
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: titleCellIdentifier)
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: newsCellIndetifier)
        
        // implement pull to refresh feature
        pullToRefresh = UIRefreshControl()
        pullToRefresh.addTarget(self, action: #selector(sendNetworkRequest), for: .valueChanged)
        collectionView.addSubview(pullToRefresh)
        
        createAndLoadInterstitial() /* get the ad ready */
        sendNetworkRequest() /* get the news from the API */
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
    
    // This func will decide whether it will show an insterstitial ad or not.
    // Will only be called in viewWillAppear
    private func showGoogleInterstialAd() {
        let chanceOfAd = arc4random_uniform(2) /* will generate either 0 or 1 */
        if showInterstitialAd { /* if this is true, there's a 50% chance that an ad will show */
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
        // test ad unit ID = "ca-app-pub-3940256099942544/4411468910"
        // real ad unit ID = "ca-app-pub-9738856726428126/3854403543"
        
        interstitialAd = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made.
        request.testDevices = [ kGADSimulatorID, "4804ce1f66b692f816baab2372878863" ]
        interstitialAd.load(request)
    }
    
    // This function will allow tapping the the tab bar item to scroll to the top.
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // if we did not come straight from another View Controller, user will be able to tap to scroll to the top.
        if !didComeFromAnotherViewController {
            self.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        } else {
            // else will be called when the user presses the tab bar item to go back to this page
            // set the didComeFromAnotherViewController back to false.
            didComeFromAnotherViewController = false
        }
    }
    
    // This function notifies the view controller that a segue is about to be performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toNavigationController = segue.destination as? UINavigationController {
            let toWebViewController = toNavigationController.viewControllers.first as! WebViewController
            toWebViewController.urlString = sender as! String
            showInterstitialAd = true
        }
    }
    
    // MARK - CollectionView

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArticles.count + 1 /* add 1 for the title cell */
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
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newsCellIndetifier, for: indexPath) as? NewsCollectionViewCell {
                cell.updateNewsFeed(with: newsArticles[indexPath.item - 1])
                return cell
            } else {
                return NewsCollectionViewCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 { /* return the cell size for the Header Title */
            return CGSize(width: view.frame.width, height: view.frame.height / 10)
        } else { /* return the cell size for the feed */
            return CGSize(width: view.frame.width, height: view.frame.height / 3)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // This function tells the delegate that the item at the specified index path was selected.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newsUrl = newsArticles[indexPath.item - 1].url
        performSegue(withIdentifier: "showWebView", sender: newsUrl)
    }
    
    // MARK - Networking
    
    @objc private func sendNetworkRequest() {
        // create a session & request
        let session = URLSession.shared
        let request = URLRequest(url: apiURL())
        
        // create a network request
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // TODO: check data, response, & error.
            
            // Initialize newsArticle array to zero
            // So when pullToRefresh is called
            // & the same articles load up from JSON
            // It wont duplicate the articles in the news feed.
            self.newsArticles = []
            guard let data = data else {return}
            // parse JSON data using Decodable
            do {
                let json = try JSONDecoder().decode(CryptoCoinsNews.self, from: data)
                for ccn in json.articles {
                    self.newsArticles.append(ccn)
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

