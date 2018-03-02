//
//  CryptoInfoViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/21/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class CryptoInfoViewController: UIViewController {
    
    fileprivate var urlStringGifsFromGiphy = [String]()
    
    // description of how to get in contact with me
    fileprivate let cryptoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    // border line
    fileprivate let lineSeparator1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.76)
        return view
    }()
    
    // rank description
    fileprivate let rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // market cap of the cryptocurrency
    fileprivate let marketCapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //  description of the current price of the coin
    fileprivate let currentPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    fileprivate let availableSupplyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    fileprivate let totalSupplyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    fileprivate let maxSupplyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //  the change in percentage for the last 1 hour
    fileprivate let percentChangeIn1hr: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //  the change in percentage for the last 24 hour
    fileprivate let percentChangein24hr: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //  the change in percentage for the last 7 days
    fileprivate let percentChangein7days: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // border line
    fileprivate let lineSeparator2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.76)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cryptoTitle)
        view.addSubview(lineSeparator1)
        view.addSubview(rankLabel)
        view.addSubview(marketCapLabel)
        view.addSubview(currentPriceLabel)
        view.addSubview(availableSupplyLabel)
        view.addSubview(totalSupplyLabel)
        view.addSubview(maxSupplyLabel)
        view.addSubview(percentChangeIn1hr)
        view.addSubview(percentChangein24hr)
        view.addSubview(percentChangein7days)
        view.addSubview(lineSeparator2)
        
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
            
            availableSupplyLabel.topAnchor.constraint(equalTo: currentPriceLabel.bottomAnchor, constant: 17),
            availableSupplyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            availableSupplyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            totalSupplyLabel.topAnchor.constraint(equalTo: availableSupplyLabel.bottomAnchor, constant: 17),
            totalSupplyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            totalSupplyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            maxSupplyLabel.topAnchor.constraint(equalTo: totalSupplyLabel.bottomAnchor, constant: 17),
            maxSupplyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            maxSupplyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            percentChangeIn1hr.topAnchor.constraint(equalTo: maxSupplyLabel.bottomAnchor, constant: 17),
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
            lineSeparator2.topAnchor.constraint(equalTo: percentChangein7days.bottomAnchor, constant: 40)])
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func updateCryptoData(from model: CoinMarketCap) {
        
        // TITLE
        let titleAttributedText = NSMutableAttributedString(string: "\(model.name)\n", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 40, weight: .semibold),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))])
        titleAttributedText.append(NSAttributedString(string: "\(model.symbol)", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 19, weight: .medium),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))]))
        cryptoTitle.attributedText = titleAttributedText
        
        // RANK
        let rankAttributedText = NSMutableAttributedString(string: "Rank: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        rankAttributedText.append(NSAttributedString(string: "#\(model.rank)", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        rankLabel.attributedText = rankAttributedText
        
        // MARKET CAP
        let marketCapAttributedText = NSMutableAttributedString(string: "Market Cap: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        marketCapAttributedText.append(NSAttributedString(string: "\(convertToCurrency(model.market_cap_usd))", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        marketCapLabel.attributedText = marketCapAttributedText
        
        // CURRENT PRICE
        let currentPriceattributedText = NSMutableAttributedString(string: "Current Price: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        currentPriceattributedText.append(NSAttributedString(string: "\(convertToCurrency(model.price_usd))", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        currentPriceLabel.attributedText = currentPriceattributedText
        
        // AVAILABLE SUPPLY
        let availableSupplyattributedText = NSMutableAttributedString(string: "Available Supply: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        availableSupplyattributedText.append(NSAttributedString(string: "\(formatNumberWithCommas(model.available_supply))", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        availableSupplyLabel.attributedText = availableSupplyattributedText
        
        // TOTAL SUPPLY
        let totalSupplyattributedText = NSMutableAttributedString(string: "Total Supply: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        totalSupplyattributedText.append(NSAttributedString(string: "\(formatNumberWithCommas(model.total_supply))", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        totalSupplyLabel.attributedText = totalSupplyattributedText
        
        // MAX SUPPLY
        let maxSupplyattributedText = NSMutableAttributedString(string: "Max Supply: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        var maxSupplyValue = "No Data"
        if let maxSupply = model.max_supply {
            maxSupplyValue = maxSupply
            maxSupplyValue = formatNumberWithCommas(maxSupplyValue)
        }
        maxSupplyattributedText.append(NSAttributedString(string: "\(maxSupplyValue)", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]))
        maxSupplyLabel.attributedText = maxSupplyattributedText
        
        // 1 HR
        let changeIn1hrattributedText = NSMutableAttributedString(string: "Percent Change in 1hr: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        let percentChange1hr = Double(model.percent_change_1h)!
        if percentChange1hr >= 0 {
            changeIn1hrattributedText.append(NSAttributedString(string: "\(model.percent_change_1h)%", attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
                NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.6745098039, green: 1, blue: 0.3960784314, alpha: 1))]))
            percentChangeIn1hr.attributedText = changeIn1hrattributedText
        } else {
            changeIn1hrattributedText.append(NSAttributedString(string: "\(model.percent_change_1h)%", attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
                NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.3960784314, blue: 0.3960784314, alpha: 1))]))
            percentChangeIn1hr.attributedText = changeIn1hrattributedText
        }
        
        // 24 HR
        let changeIn24hrattributedText = NSMutableAttributedString(string: "Percent Change in 24hr: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        let percentChangein24 = Double(model.percent_change_24h)!
        if percentChangein24 >= 0 {
            changeIn24hrattributedText.append(NSAttributedString(string: "\(model.percent_change_24h)%", attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
                NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.6745098039, green: 1, blue: 0.3960784314, alpha: 1))]))
            percentChangein24hr.attributedText = changeIn24hrattributedText
        } else {
            changeIn24hrattributedText.append(NSAttributedString(string: "\(model.percent_change_24h)%", attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
                NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.3960784314, blue: 0.3960784314, alpha: 1))]))
            percentChangein24hr.attributedText = changeIn24hrattributedText
        }
        
        // 7 DAYS
        let changeIn7daysattributedText = NSMutableAttributedString(string: "Percent Change in 7 days: ", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        let percentChangein7 = Double(model.percent_change_7d)!
        if percentChangein7 >= 0 {
            changeIn7daysattributedText.append(NSAttributedString(string: "\(model.percent_change_7d)%", attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
                NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.6745098039, green: 1, blue: 0.3960784314, alpha: 1))]))
            percentChangein7days.attributedText = changeIn7daysattributedText
        } else {
            changeIn7daysattributedText.append(NSAttributedString(string: "\(model.percent_change_7d)%", attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20, weight: .light),
                NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1, green: 0.3960784314, blue: 0.3960784314, alpha: 1))]))
            percentChangein7days.attributedText = changeIn7daysattributedText
        }
    }
    
    // This function will convert a number into currency format
    fileprivate func convertToCurrency(_ number: String) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        let numberDouble = Double(number)!
        if numberDouble >= 1000 {
            //numberString = convertToCurrency(number: numberDouble)
            let priceOfCoin: NSNumber = numberDouble as NSNumber
            let priceString = currencyFormatter.string(from: priceOfCoin)!
            return priceString
        }
        return "$\(number)"
    }
    
    // This function will format large numbers with commas -> (1000 ->> 1,000)
    fileprivate func formatNumberWithCommas(_ number: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let numberDouble: Double = Double(number)!
        let numberToNSNumber: NSNumber = numberDouble as NSNumber
        let formattedNumber: String = numberFormatter.string(from: numberToNSNumber)!
        return formattedNumber
    }
}
