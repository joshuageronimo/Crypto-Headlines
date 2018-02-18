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
    private let headerTitle: UILabel = {
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
        let attributedText = NSMutableAttributedString(string: "\(title.headerTitle)",
                                                       attributes: [
                                                        NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 28),
                                                        NSAttributedStringKey.foregroundColor : UIColor.white])
        
        attributedText.append(NSAttributedString(string: "\n \(title.subTitle)",
                                                 attributes: [
                                                    NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14, weight: .light),
                                                    NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))]))
        headerTitle.attributedText = attributedText
        
    }
    
    // Will setup the constraint of the header title
    private func setUpHeaderLayout() {
        addSubview(headerTitle)
        NSLayoutConstraint.activate([headerTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
