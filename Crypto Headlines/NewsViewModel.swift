//
//  NewsViewModel.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct NewsViewModel: View {
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .circular)                        .fill(Color("accent_dark"))
                    .shadow(radius: 10)
                    .frame(width: nil, height: 100)
                Text("SEC Subpoenas 80 Cryptocurrency Firms, Including TechCrunch Fund")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, -40.0)
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
    }
}

struct NewsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        NewsViewModel()
    }
}
