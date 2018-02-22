//
//  CryptoInfoViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/21/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class CryptoInfoViewController: UIViewController {
    
    private var urlStringGifsFromGiphy = [String]()
    
    // description of how to get in contact with me
    private let cryptoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Bitcoin\n", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 40, weight: .semibold),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))])
        attributedText.append(NSAttributedString(string: "BTC", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 19, weight: .medium),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))]))
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        label.textAlignment = .center
        return label
    }()
    
    // border line
    private let lineSeparator1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.76)
        return view
    }()
    
    // rank description
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Rank: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        
        attributedText.append(NSAttributedString(string: "#1", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    // rank description
    private let marketCapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Market Cap: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        
        attributedText.append(NSAttributedString(string: "$179,921,384,395", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
    
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    //  description of the current price of the coin
    private let currentPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Current Price: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        
        attributedText.append(NSAttributedString(string: "$10,661.30", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    //  the change in percentage for the last 1 hour
    private let percentChangeIn1hr: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Percent Change in 1hr: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        
        attributedText.append(NSAttributedString(string: "1.32%", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.6745098039, green: 1, blue: 0.3960784314, alpha: 1))]))
        
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    //  the change in percentage for the last 24 hour
    private let percentChangein24hr: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Percent Change in 24hr: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        
        attributedText.append(NSAttributedString(string: "-8.72%", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.3960784314, blue: 0.3960784314, alpha: 1))]))
        
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    //  the change in percentage for the last 7 days
    private let percentChangein7days: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Percent Change in 7 days: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        
        attributedText.append(NSAttributedString(string: "13.0%", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.6745098039, green: 1, blue: 0.3960784314, alpha: 1))]))
        
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    // border line
    private let lineSeparator2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.76)
        return view
    }()
    
    //  The label that will contains a message whether the coin has been doing good or not
    private let goodOrBadWeek: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Great Week for Bitcoin!", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 25, weight: .semibold),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))])
        
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        label.textAlignment = .center
        return label
    }()
    
    // This will be the imageView that will contain a gif to show the user
    private let gifImageView: UIImageView = {
        let gifURL : String = "https://media0.giphy.com/media/5GoVLqeAOo6PK/200w.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let image = UIImageView(image: imageURL)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendNetworkRequest()
        
        view.addSubview(cryptoTitle)
        view.addSubview(lineSeparator1)
        view.addSubview(rankLabel)
        view.addSubview(marketCapLabel)
        view.addSubview(currentPriceLabel)
        view.addSubview(percentChangeIn1hr)
        view.addSubview(percentChangein24hr)
        view.addSubview(percentChangein7days)
        view.addSubview(lineSeparator2)
        view.addSubview(goodOrBadWeek)
        view.addSubview(gifImageView)
        
        NSLayoutConstraint.activate([
            cryptoTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cryptoTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            
            lineSeparator1.heightAnchor.constraint(equalToConstant: 1),
            lineSeparator1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            lineSeparator1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            lineSeparator1.topAnchor.constraint(equalTo: cryptoTitle.bottomAnchor, constant: 10),
            
            rankLabel.topAnchor.constraint(equalTo: lineSeparator1.bottomAnchor, constant: 35),
            rankLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            rankLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            marketCapLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: 17),
            marketCapLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            marketCapLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            currentPriceLabel.topAnchor.constraint(equalTo: marketCapLabel.bottomAnchor, constant: 17),
            currentPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            currentPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            percentChangeIn1hr.topAnchor.constraint(equalTo: currentPriceLabel.bottomAnchor, constant: 17),
            percentChangeIn1hr.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            percentChangeIn1hr.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            percentChangein24hr.topAnchor.constraint(equalTo: percentChangeIn1hr.bottomAnchor, constant: 17),
            percentChangein24hr.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            percentChangein24hr.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            percentChangein7days.topAnchor.constraint(equalTo: percentChangein24hr.bottomAnchor, constant: 17),
            percentChangein7days.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            percentChangein7days.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            lineSeparator2.heightAnchor.constraint(equalToConstant: 1),
            lineSeparator2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            lineSeparator2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            lineSeparator2.topAnchor.constraint(equalTo: percentChangein7days.bottomAnchor, constant: 40),
            
            goodOrBadWeek.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 25),
            goodOrBadWeek.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            goodOrBadWeek.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            gifImageView.topAnchor.constraint(equalTo: goodOrBadWeek.bottomAnchor, constant: 25),
            gifImageView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -15),
            gifImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK - Networking
    
    @objc private func sendNetworkRequest() {
        // create a session & request
        let session = URLSession.shared
        
        let request = URLRequest(url: apiURL())
        
        // create a network request
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // TODO: check data, response, & error.
        
            guard let data = data else {return}
            // parse JSON data using Decodable
            do {
                print("hi")
                let json = try JSONDecoder().decode(Giphy.self, from: data)
                print("hi 2 \(json)")
                for gif in json.data {
                    self.urlStringGifsFromGiphy.append(gif.images.original.url)
                }
                
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
            GiphyConstant.MethodParameters.apiKey : GiphyConstant.MethodValues.apiKey as AnyObject,
            GiphyConstant.MethodParameters.query : GiphyConstant.MethodValues.query as AnyObject,
            GiphyConstant.MethodParameters.limit : GiphyConstant.MethodValues.limit as AnyObject,
            GiphyConstant.MethodParameters.language : GiphyConstant.MethodValues.language as AnyObject
        ]
        
        // Construct Base Api
        var components = URLComponents()
        components.scheme = GiphyConstant.BaseApi.scheme
        components.host = GiphyConstant.BaseApi.host
        components.path = GiphyConstant.BaseApi.path
        
        // Construct Query
        components.queryItems = [URLQueryItem]()
        for (key, value) in urlQueryParameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
}
