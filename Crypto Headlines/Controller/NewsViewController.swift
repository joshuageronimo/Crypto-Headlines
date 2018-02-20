//
//  NewsViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var newsArticles = [CryptoCoinsNews.Articles]()
    private var pullToRefresh: UIRefreshControl!
    private let titleCellIdentifier = "TitleCell"
    private let newsCellIndetifier = "NewsCell"
    
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
        
        sendNetworkRequest()
    }
    
    // This function notifies the view controller that a segue is about to be performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toNavigationController = segue.destination as? UINavigationController {
            let toWebViewController = toNavigationController.viewControllers.first as! WebViewController
            toWebViewController.urlString = sender as! String
        }
    }
    
    // MARK - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArticles.count + 1
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

