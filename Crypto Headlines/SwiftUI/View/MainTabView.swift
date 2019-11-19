//
//  MainTabView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/16/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection = 0
    init() {
        UITabBar.appearance().barTintColor = .mainColor
    }
    
    var body: some View {
        TabView(selection: $selection) {
            NewsFeedView()
                .tabItem {
                    Image("news")
            }.tag(0)
            CryptoView()
                .tabItem {
                    Image("coins")
            }.tag(1)
            DeveloperView()
                .tabItem {
                    Image("happy")
            }.tag(2)
            }
            .accentColor(.white)
            .edgesIgnoringSafeArea(.top)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
