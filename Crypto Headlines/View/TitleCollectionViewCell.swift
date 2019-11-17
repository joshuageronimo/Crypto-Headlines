//
//  TitleCollectionViewCell.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    // Label for the header title
    fileprivate let headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHeaderLayout()
    }
    
    func updateHeader(title: TitleHeader) {
        let attributedText = NSMutableAttributedString(string: "\(title.headerTitle)", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 28),
            NSAttributedString.Key.foregroundColor : UIColor(named:"primary_text")!])
        
        attributedText.append(NSAttributedString(string: "\n \(title.subTitle)", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .light),
            NSAttributedString.Key.foregroundColor : UIColor(named:"accent_light")!]))
        headerTitle.attributedText = attributedText
    }
    
    // Will setup the constraint of the header title
    fileprivate func setUpHeaderLayout() {
        addSubview(headerTitle)
        NSLayoutConstraint.activate([headerTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
