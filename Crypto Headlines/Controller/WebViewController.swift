//
//  WebViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/18/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var urlString: String!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        webView.load(request)
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func actionButtonTapped(_ sender: Any) {
        let activityItems = [urlString] as! Array<String>
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    @IBAction func safariButtonTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: urlString)!)
    }
    @IBAction func goBack(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func goForward(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            if webView.estimatedProgress == 1.0 {
                navigationItem.title = webView.title
            } else {
                navigationItem.title = "Loading…"
            }
        }
    }
}
