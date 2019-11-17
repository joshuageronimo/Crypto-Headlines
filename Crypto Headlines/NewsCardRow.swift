//
//  NewsViewModel.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct NewsCardRow: View {
    var title: Text
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .fill(Color("accent_dark"))
                    .shadow(radius: 10)
                    .frame(width: nil, height: 100)
                title
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.init(top: -40, leading: 10, bottom: 0, trailing: 10))
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            }
            Image("bitcoin")
                .resizable()
                .clipped()
                .cornerRadius(20)
                .padding(.top, -50)
                .shadow(radius: 10)
                .frame(width: nil, height: 150)
        }
        .padding(.top, 15.0)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NewsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardRow(title: Text("Title"))
    }
}
