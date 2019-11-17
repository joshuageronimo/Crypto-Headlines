//
//  DeveloperView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/16/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct DeveloperView: View {
    
    var body: some View {
        // FIRST SECTION
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading) {
                Text("Geronimo App")
                    .foregroundColor(.white)
                    .font(.title)
                Text("developer page")
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            // Developer Info
            HStack(spacing: 20) {
                CircleImage(image: Image("profile_picture"))
                VStack(alignment: .leading, spacing: 10) {
                    Text("Joshua Geronimo")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    VStack(alignment: .leading) {
                        Text("- Based in NYC 🇺🇸")
                            .foregroundColor(.white)
                        Text("- Mobile App Developer 👨🏻‍💻")
                        .foregroundColor(.white)
                        Text("- I work at Wheeli 🚘")
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
                         .foregroundColor(.white)
                    Text("- New sources: CryptoCoinsNews(CCN)")
                        .foregroundColor(.white)
                    Text("- Coin prices: CoinMarketCap.com")
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
                         .foregroundColor(.white)
                    Text("- DM me on Instagram for feature requests")
                        .foregroundColor(.white)
                    Text("- Checkout my other projects on Github")
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
        .background(Color.init(.mainColor).edgesIgnoringSafeArea(.all))
    }
    
    // MARK: BUTTON FUCTIONS
    
    fileprivate func goToGithub() {
        print("go to github")
    }
    
    fileprivate func goToLinkedIn() {
        print("go to linkedIn")
    }
    
    fileprivate func goToInstagram() {
        print("go to instagram")
    }
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}
