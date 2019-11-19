//
//  CryptoRow.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct CryptoRow: View {
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.mainColor)
                .frame(width: nil, height: screenHeight * 0.18, alignment: .center)
                .shadow(radius: 10)
            HStack() {
                // Rank # & Currency Symbol
                VStack(alignment: .leading, spacing: 5) {
                    Text("#1")
                        .foregroundColor(.accentColor)
                    Text("BTC")
                    .foregroundColor(.white)
                        .font(.largeTitle)
                }.padding(.init(top: 0, leading: 25, bottom: 0, trailing: 0))
                Spacer()
                // Currency Price Status
                VStack(alignment: .leading, spacing: 5) {
                    Text("$7,897.00")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    HStack {
                        Text("Past Day")
                        .foregroundColor(.accentColor)
                        Text("(2.89%)")
                            .foregroundColor(Color("positive"))
                    }
                }.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 25))
            }
        }
        .padding(.top, 15)

    }
}

struct CryptoRow_Previews: PreviewProvider {
    static var previews: some View {
        CryptoRow()
            .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                                  height: UIScreen.main.bounds.height * 0.18 + 15))
    }
}
