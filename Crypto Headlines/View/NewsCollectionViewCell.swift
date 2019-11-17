//
//  NewsCollectionViewCell.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    // view container for the news title
    fileprivate let titleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "accent_dark")!
        view.layer.cornerRadius = 25
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    // Label for the news title
    fileprivate let newsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        return label
    }()
    
    // This will be the container of newsThumbnail
    fileprivate let thumbnailContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
    // this will be where the image is going to show
    fileprivate let newsThumbnail: CustomImageView = {
        let image = CustomImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpNewsFeedLayout()
    }
    
    // Will update the cell's data
    func updateNewsFeed(with news: CryptoCoinsNews.Articles) {
        // load the title of the news articles
        let attributedText = NSMutableAttributedString(string: news.title , attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold),
            NSAttributedString.Key.foregroundColor : UIColor(named: "primary_text")!])
        newsTitle.attributedText = attributedText
        newsTitle.textAlignment = .center
        // load the images
        newsThumbnail.loadImageUsingUrlString(urlString: news.urlToImage)
    }
    
    // Will setup constraints for the view objects
    fileprivate func setUpNewsFeedLayout() {
        addSubview(titleContainer)
        titleContainer.addSubview(newsTitle)
        addSubview(thumbnailContainer)
        thumbnailContainer.addSubview(newsThumbnail)
        
        // setup constraints
        NSLayoutConstraint.activate([
            // titleContainer - Constraint
            titleContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            titleContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            titleContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27),
            // newsTitle - Constraint
            newsTitle.topAnchor.constraint(equalTo: titleContainer.topAnchor, constant: 10),
            newsTitle.bottomAnchor.constraint(equalTo: thumbnailContainer.topAnchor, constant: -10),
            newsTitle.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 8),
            newsTitle.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor, constant: -8),
            // thumbnailContainer - Constraint
            thumbnailContainer.topAnchor.constraint(equalTo: titleContainer.topAnchor, constant: 55),
            thumbnailContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            thumbnailContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            thumbnailContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27),
            // newsThumbnail - Constraint
            newsThumbnail.topAnchor.constraint(equalTo: titleContainer.topAnchor, constant: 55),
            newsThumbnail.heightAnchor.constraint(equalTo: thumbnailContainer.heightAnchor),
            newsThumbnail.leadingAnchor.constraint(equalTo: thumbnailContainer.leadingAnchor),
            newsThumbnail.trailingAnchor.constraint(equalTo: thumbnailContainer.trailingAnchor)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
