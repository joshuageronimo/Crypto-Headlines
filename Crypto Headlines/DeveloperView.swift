//
//  DeveloperView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/16/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct DeveloperView: View {
    
    fileprivate let gitHubProfileLink = "https://github.com/joshuageronimo"
    fileprivate let linkedInProfileLink = "https://www.linkedin.com/in/blessed-joshua-geronimo-200791108/"
    fileprivate let instagramProfileLink = "https://www.instagram.com/developer.josh/"
    
    var body: some View {
        // FIRST SECTION
        ZStack {
            // Set background color
            Color.mainColor
                .edgesIgnoringSafeArea(.all)
            // all UI components are inside this VStack
            VStack(alignment: .leading, spacing: 25) {
                TitleHeaderView(mainTitle: Text("Geronimo App"),
                                subTitle: Text("developer page"))
                // Developer Info
                HStack(spacing: 20) {
                    CircleImage(image: Image("profile_picture")
                        .resizable()).frame(width: 80, height: 80)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Joshua Geronimo")
                            .font(.system(size: 20))
                            .foregroundColor(.accentColor)
                        VStack(alignment: .leading) {
                            Text("- Based in NYC 🇺🇸")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            Text("- Mobile App Developer 👨🏻‍💻")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            Text("- I work at Wheeli 📱🚘")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                // SECOND SECTION
                VStack(alignment: .leading, spacing: 15) {
                    Divider()
                        .background(Color.white)
                        .frame(width: nil, height: 1, alignment: .center)
    
                    Text("Crypto Headlines")
                            .foregroundColor(.white)
                            .font(.title)
                    VStack(alignment: .leading) {
                        Text("- Powered by: News API")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        Text("- New sources: CryptoCoinsNews(CCN)")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        Text("- Coin prices: CoinMarketCap.com")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                     }
                }
    
                // THIRD SECTION
                VStack(alignment: .leading, spacing: 15) {
                    Divider()
                        .background(Color.white)
                        .frame(width: nil, height: 1, alignment: .center)
    
                    Text("Let's Work Together!")
                            .foregroundColor(.white)
                            .font(.title)
                    VStack(alignment: .leading) {
                        Text("- For recruiters: Message me on LinkedIn")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        Text("- DM me on Instagram for feature requests")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        Text("- Checkout my other projects on Github")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                     }
                }
                Spacer()
    
                // SOCIAL MEDIA SECTION
                HStack(alignment: .center, spacing: 30) {
                    Spacer()
                    Button(action: {
                        self.goToGithub()
                    }) {
                            Image("github-logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
    
                    Button(action: {
                        self.goToLinkedIn()
                    }) {
                            Image("linkedIn-logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
    
                    Button(action: {
                        self.goToInstagram()
                    }) {
                            Image("instagram-logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
            }
            .padding(25)
        }
    }
    
    // MARK: BUTTON FUCTIONS
    // - the following 3 functions will direct to my social media profiles
    fileprivate func goToGithub() {
        UIApplication.shared.open(URL(string: gitHubProfileLink)!)
    }
    
    fileprivate func goToLinkedIn() {
        UIApplication.shared.open(URL(string: linkedInProfileLink)!)
    }
    
    fileprivate func goToInstagram() {
        UIApplication.shared.open(URL(string: instagramProfileLink)!)
    }
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}
