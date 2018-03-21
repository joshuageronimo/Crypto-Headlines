//
//  DeveloperViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/14/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class DeveloperViewController: UIViewController {
    
    fileprivate let webViewIdentifier = "showProfile"
    fileprivate let gitHubProfileLink = "https://github.com/joshuageronimo"
    fileprivate let linkedInProfileLink = "https://www.linkedin.com/in/blessed-joshua-geronimo-200791108/"
    fileprivate let instagramProfileLink = "https://www.instagram.com/developer.josh/"
    
    // Label for the header title
    fileprivate let headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string: (TitleSource.instance.array.last?.headerTitle)!,
            attributes: [
                NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 28),
                NSAttributedStringKey.foregroundColor : UIColor.white])
        
        attributedText.append(NSAttributedString(string: "\n \((TitleSource.instance.array.last?.subTitle)!)",
            attributes: [
                NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14, weight: .light),
                NSAttributedStringKey.foregroundColor : UIColor(named:"accent_light")!]))
        label.attributedText = attributedText
        return label
    }()
    
    // UIImage for Profile Picture
    fileprivate let profilePicture: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "profile_picture"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Title for the developer Info
    fileprivate let developerInfoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Joshua Geronimo (iOS Developer)", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15, weight: .medium),
            NSAttributedStringKey.foregroundColor : UIColor(named:"accent_light")!])
        
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    // Description of the developer info
    fileprivate let developerInfoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "- Based in NJ, USA 🇺🇸\n- Computer Science Student 👨🏻‍💻\n- iOS Freelancer 📱", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor(named:"primary_text")!])
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    // border line
    fileprivate let lineSeparator1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named:"border_line")!
        return view
    }()
    
    // Title for the App's about info
    fileprivate let cryptoHeadlinesAboutTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Crypto Headlines", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 22, weight: .semibold),
            NSAttributedStringKey.foregroundColor : UIColor(named:"primary_text")!])
        label.attributedText = attributedText
        return label
    }()
    
    // Description of the app's info
    fileprivate let cryptoHeadlinesInfoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "- Powered by: News API\n- News source: CryptoCoinsNews (CCN)\n- Coin prices: CoinMarketCap.com", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor(named:"primary_text")!])
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    // border line
    fileprivate let lineSeparator2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.76)
        return view
    }()
    
    // Title for the work together section
    fileprivate let workTogetherTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Let's Work Together!", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 22, weight: .semibold),
            NSAttributedStringKey.foregroundColor : UIColor(named:"primary_text")!])
        label.attributedText = attributedText
        return label
    }()
    
    // description of how to get in contact with me
    fileprivate let workTogetherInfoDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "- For recruiters: Message me on LinkedIn.\n- DM me on Instagram for feature requests.\n- Check out my other projects on Github.", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16, weight: .light),
            NSAttributedStringKey.foregroundColor : UIColor(named:"primary_text")!])
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.attributedText = attributedText
        return label
    }()
    
    // Title of the section to get in contact with me
    fileprivate let contactInfoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Connect with me here!", attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 22, weight: .semibold),
            NSAttributedStringKey.foregroundColor : UIColor(named:"primary_text")!])
        label.attributedText = attributedText
        return label
    }()
    
    // github image logo
    fileprivate let githubLogo: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "github-logo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(showGithubProfile), for: .touchUpInside)
        return button
    }()
    
    // linkedIn image logo
    fileprivate let linkedInLogo: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "linkedIn-logo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(showLinkedInProfile), for: .touchUpInside)
        return button
    }()
    
    // instagram image logo
    fileprivate let instagramLogo: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "instagram-logo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(showInstagramProfile), for: .touchUpInside)
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDeveloperLayout()
    }
    
    // go to my Github profile
    @objc func showGithubProfile() {
        UIApplication.shared.open(URL(string: gitHubProfileLink)!)
    }
    
    // go to my LinkedIn Profile
    @objc func showLinkedInProfile() {
        UIApplication.shared.open(URL(string: linkedInProfileLink)!)
    }
    
    // go to my Instagram profile
    @objc func showInstagramProfile() {
        UIApplication.shared.open(URL(string: instagramProfileLink)!)
    }
    
    // This function will do AutoLayout for this view controller.
    fileprivate func setUpDeveloperLayout() {
        // set up stackview for the 3 social media logos at the bottom
        let socialMediaLogoStackView = UIStackView(arrangedSubviews: [githubLogo, linkedInLogo, instagramLogo])
        socialMediaLogoStackView.distribution = .equalCentering
        socialMediaLogoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // add objects into the screen
        view.addSubview(headerTitle)
        view.addSubview(profilePicture)
        view.addSubview(developerInfoTitle)
        view.addSubview(developerInfoDescription)
        view.addSubview(lineSeparator1)
        view.addSubview(cryptoHeadlinesAboutTitle)
        view.addSubview(cryptoHeadlinesInfoDescription)
        view.addSubview(lineSeparator2)
        view.addSubview(workTogetherTitle)
        view.addSubview(workTogetherInfoDescription)
        view.addSubview(contactInfoTitle)
        view.addSubview(socialMediaLogoStackView)
        
        // set up constraints
        NSLayoutConstraint.activate([
            headerTitle.heightAnchor.constraint(equalToConstant: view.frame.height / 10),
            headerTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            profilePicture.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 5),
            profilePicture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            developerInfoTitle.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 18),
            developerInfoTitle.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            developerInfoTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            developerInfoDescription.topAnchor.constraint(equalTo: developerInfoTitle.bottomAnchor, constant: 10),
            developerInfoDescription.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            developerInfoDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            lineSeparator1.heightAnchor.constraint(equalToConstant: 1),
            lineSeparator1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            lineSeparator1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            lineSeparator1.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 20),
            
            cryptoHeadlinesAboutTitle.topAnchor.constraint(equalTo: lineSeparator1.bottomAnchor, constant: 10),
            cryptoHeadlinesAboutTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            cryptoHeadlinesInfoDescription.topAnchor.constraint(equalTo: cryptoHeadlinesAboutTitle.bottomAnchor, constant: 15),
            cryptoHeadlinesInfoDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            lineSeparator2.heightAnchor.constraint(equalToConstant: 1),
            lineSeparator2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            lineSeparator2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            lineSeparator2.topAnchor.constraint(equalTo: cryptoHeadlinesInfoDescription.bottomAnchor, constant: 20),
            
            workTogetherTitle.topAnchor.constraint(equalTo: lineSeparator2.bottomAnchor, constant: 10),
            workTogetherTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            workTogetherInfoDescription.topAnchor.constraint(equalTo: workTogetherTitle.bottomAnchor, constant: 15),
            workTogetherInfoDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            workTogetherInfoDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            contactInfoTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactInfoTitle.topAnchor.constraint(greaterThanOrEqualTo: workTogetherInfoDescription.bottomAnchor, constant: 10),
            contactInfoTitle.bottomAnchor.constraint(equalTo: socialMediaLogoStackView.topAnchor, constant: -10),
            
            socialMediaLogoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            socialMediaLogoStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            socialMediaLogoStackView.widthAnchor.constraint(equalTo: contactInfoTitle.widthAnchor, multiplier: 0.8)])
    }
}
