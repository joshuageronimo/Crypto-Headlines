//
//  DeveloperViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class DeveloperViewController: UIViewController {
    
    // Label for the header title
    private let headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "GeronimoApp",
            attributes: [
                NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 28),
                NSAttributedStringKey.foregroundColor : UIColor.white])
        
        attributedText.append(NSAttributedString(string: "\n developer page",
            attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14, weight: .light),
                NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))]))
        label.attributedText = attributedText
        return label
    }()
    
    private let profilePicture: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "profile_picture"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let developerInfoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Joshua Geronimo (iOS Developer)", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15, weight: .medium),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 0.9568627451, green: 0.6980392157, blue: 0.6980392157, alpha: 0.76))])
        
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    private let developerInfoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "- Based in NJ, USA 🇺🇸 \n- Computer Science Student 👨🏻‍💻 \n- iOS Freelancer 📱", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor.init(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))])
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    private let lineSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.76)
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDeveloperLayout()
    }
    
    func setUpDeveloperLayout() {
        
        view.addSubview(headerTitle)
        view.addSubview(profilePicture)
        view.addSubview(developerInfoTitle)
        view.addSubview(developerInfoDescription)
        view.addSubview(lineSeparator)
        
        NSLayoutConstraint.activate([
            headerTitle.heightAnchor.constraint(equalToConstant: view.frame.height / 10),
            headerTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            profilePicture.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 10),
            profilePicture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            developerInfoTitle.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 18),
            developerInfoTitle.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            developerInfoTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            developerInfoDescription.topAnchor.constraint(equalTo: developerInfoTitle.bottomAnchor, constant: 10),
            developerInfoDescription.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            developerInfoDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            lineSeparator.heightAnchor.constraint(equalToConstant: 1),
            lineSeparator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            lineSeparator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            lineSeparator.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 20)])

    }
}
