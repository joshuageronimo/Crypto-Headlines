//
//  MainTabView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/16/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            Text("The First Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
