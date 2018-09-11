//
//  NewsViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import GoogleMobileAds

class NewsViewController: UIViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var newsArticles = [CryptoCoinsNews.Articles]()
    fileprivate var pullToRefresh: UIRefreshControl!
    fileprivate var didComeFromAnotherViewController = false
    fileprivate var interstitialAd: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the collection view delegate and datasource to the view controller
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register the custom cells
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifierConstant.titleCellIdentifier)
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifierConstant.newsCellIndetifier)
        
        // implement pull to refresh feature
        pullToRefresh = UIRefreshControl()
        pullToRefresh.addTarget(self, action: #selector(sendNetworkRequest), for: .valueChanged)
        collectionView.addSubview(pullToRefresh)
        
        createEmptyCellMessage() /* create empty cell UI incase there's an error with the network request. */
        createAndLoadInterstitial() /* get the ad ready */
        createObservers() /* create notification observers */
        sendNetworkRequest() /* get the news from the API */
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
    
    // MARK: Google Admob
    
    // This func will decide whether it will show an insterstitial ad or not.
    // Will only be called in viewWillAppear
    @objc private func showGoogleInterstialAd() {
        let chanceOfAd = arc4random_uniform(1) /* will generate either 0 or 1 */
        if chanceOfAd == 0 { /* if the generated number is equal to zero then show the ad */
            if interstitialAd.isReady { /* if the ad is ready, show the user! */
                interstitialAd.present(fromRootViewController: self) /* present the ad! */
            } else {
                print("Ad wasn't ready")
            }
        }
        didComeFromAnotherViewController = false
        createAndLoadInterstitial() /* get the next ad ready! */
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
        }
    }
    
    
    
    // MARK: Networking
    
    @objc private func sendNetworkRequest() {
        // create a session & request
        let session = URLSession.shared
        let request = URLRequest(url: apiURL())
        
        // create a network request
        let task = session.dataTask(with: request) { (data, response, error) in
            // Initialize newsArticle array to zero
            // So when pullToRefresh is called
            // & the same articles load up from JSON
            // It wont duplicate the articles in the news feed.
            self.newsArticles = []
            
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
            
            // Check if the response code is good.
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode > 200 {
                    print("Error with network request: \(httpResponse)")
                    return
                }
            }
            
            guard let data = data else {return}
            
            // Decode the JSON data that we recieved from the API
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
    
    // MARK: Empty Cell Message
    
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
    
    // MARK: Notifications
    
    // This function creates the notification needed for this view controller.
    fileprivate func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(showGoogleInterstialAd), name: NotificationConstant.newsAdNotificationKey, object: nil)
    }
    
    deinit {
        // deinit the observers.. 
        NotificationCenter.default.removeObserver(self)
    }
}

extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArticles.count + 1 /* add 1 for the title cell */
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 { /* Show the Title Header in index 0 */
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifierConstant.titleCellIdentifier, for: indexPath) as? TitleCollectionViewCell {
                if let pageIndex = self.tabBarController?.selectedIndex {
                    cell.updateHeader(title: TitleSource.instance.array[pageIndex])
                }
                return cell
            } else {
                return TitleCollectionViewCell()
            }
        } else { /* Show the news feed after index 0 */
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifierConstant.newsCellIndetifier, for: indexPath) as? NewsCollectionViewCell {
                if newsArticles.count > 0 {
                    cell.updateNewsFeed(with: newsArticles[indexPath.item - 1])
                } else {
                    DispatchQueue.main.async {
                        // Update UI
                        self.collectionView.reloadData()
                        self.pullToRefresh.endRefreshing()
                    }
                }
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
        if indexPath.item > 0 {
            let newsUrl = newsArticles[indexPath.item - 1].url
            performSegue(withIdentifier: "showWebView", sender: newsUrl)
        }
    }
}

