//
//  CoinsCollectionViewCell.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/18/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class CoinsCollectionViewCell: UICollectionViewCell {
    
    fileprivate let cryptoInfoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.1843137255, blue: 0.2235294118, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    fileprivate let cryptoNameAndRankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate let cryptoPriceAndPercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setUpLayout()
    }
    
    // This function will convert a number into currency format
    fileprivate func convertToCurrency(number: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        // localize to your grouping and decimal separator
        let priceOfCoin: NSNumber = Double(number) as NSNumber
        let priceString = currencyFormatter.string(from: priceOfCoin)!
        return priceString
    }
    
    // Will update the cell's data
    func updateCoinFeed(with coinsFrom: CoinMarketCap) {
        // load the rank & symbol of the coin
        let nameAndrankAttributedText = NSMutableAttributedString(string: "#\(coinsFrom.rank)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16, weight: .light), NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        nameAndrankAttributedText.append(NSAttributedString(string: "\n\(coinsFrom.symbol)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 36, weight: .medium), NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        cryptoNameAndRankLabel.attributedText = nameAndrankAttributedText
        
        
        var priceOfCoinInString = coinsFrom.price_usd
        let priceOfCoin = Double(coinsFrom.price_usd)!
        // convert the price into currency format
        if priceOfCoin >= 1000 {
            priceOfCoinInString = convertToCurrency(number: priceOfCoin)
        } else {
            priceOfCoinInString = "$\(priceOfCoinInString)"
        }
        
        // load the price of the coin
        let priceAndPercentAttributedText = NSMutableAttributedString(string: "\(priceOfCoinInString)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 34, weight: .light), NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))])
        
        priceAndPercentAttributedText.append(NSAttributedString(string: "\n Past Day ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17, weight: .light), NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))]))
        
        let percentChange = Double(coinsFrom.percent_change_24h)!
        // load the percent change of the coin
        if percentChange >= 0 {
            // change the percent to green if the value is positive
            priceAndPercentAttributedText.append(NSAttributedString(string: "(\(coinsFrom.percent_change_24h)%)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17, weight: .light), NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.6745098039, green: 1, blue: 0.3960784314, alpha: 1))]))
        } else {
            // change the percent to red if the value is negative
            priceAndPercentAttributedText.append(NSAttributedString(string: "(\(coinsFrom.percent_change_24h)%)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17, weight: .light), NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.3960784314, blue: 0.3960784314, alpha: 1))]))
        }
        cryptoPriceAndPercentLabel.attributedText = priceAndPercentAttributedText
    }
    
    fileprivate func setUpLayout() {
        addSubview(cryptoInfoContainer)
        cryptoInfoContainer.addSubview(cryptoNameAndRankLabel)
        cryptoInfoContainer.addSubview(cryptoPriceAndPercentLabel)
        
        NSLayoutConstraint.activate([
            // constraints for cryptoInfoContainer
            cryptoInfoContainer.topAnchor.constraint(equalTo: topAnchor),
            cryptoInfoContainer.heightAnchor.constraint(equalTo: heightAnchor),
            cryptoInfoContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            cryptoInfoContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            // constraints for cryptoNameAndRankLabel
            cryptoNameAndRankLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            cryptoNameAndRankLabel.widthAnchor.constraint(equalToConstant: frame.width / 3.5),
            cryptoNameAndRankLabel.leadingAnchor.constraint(equalTo: cryptoInfoContainer.leadingAnchor, constant: 14),
            // constraints for cryptoPriceAndPercentLabel
            cryptoPriceAndPercentLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            cryptoPriceAndPercentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width / 2.2),
            cryptoPriceAndPercentLabel.trailingAnchor.constraint(equalTo: cryptoInfoContainer.trailingAnchor, constant: -12)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
