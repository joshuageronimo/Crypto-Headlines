//
//  CryptoCardRow.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct CryptoCardRow: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    var rankNumber: Text
    var cryptoSymbol: Text
    var price: Text
    var status: Text
    
    var body: some View {
        ZStack {
            Color.secondaryColor.edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.mainColor)
                .frame(width: nil, height: screenHeight * 0.17, alignment: .center)
                .shadow(radius: 10)
            HStack() {
                // Rank # & Currency Symbol
                VStack(alignment: .leading, spacing: 5) {
                    rankNumber
                        .foregroundColor(.accentColor)
                        .fontWeight(.medium)
                    cryptoSymbol
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }.padding(.init(top: 0, leading: 25, bottom: 0, trailing: 0))
                Spacer()
                // Currency Price Status
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .firstTextBaseline) {
                        price
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .minimumScaleFactor(0.7)
                            .lineLimit(1)
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                        Spacer()
                            
                    }

          
                    HStack(alignment: .firstTextBaseline) {
                        Text("Past Day")
                            .foregroundColor(.accentColor)
                            .multilineTextAlignment(.leading)
                        status
                            .foregroundColor(.positiveColor)
                            .fontWeight(.medium)
                    }
                    
                }
                .frame(width: screenWidth * 0.37, height: nil)
                .padding(.init(top: 0, leading: 1, bottom: 0, trailing: 20))
            }
        }
        .padding(.top, 15)

    }
}

struct CryptoCardRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CryptoCardRow(rankNumber: Text("#1"),
                          cryptoSymbol: Text("BTC"),
                          price: Text("$7,897.00"),
                          status: Text("(2.89%)"))
                .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                                      height: UIScreen.main.bounds.height * 0.17))
            
            CryptoCardRow(rankNumber: Text("#2"), cryptoSymbol: Text("ABC"), price: Text("$0.000000"), status: Text("(2.89%)"))
                .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                                      height: UIScreen.main.bounds.height * 0.17))
            
            CryptoCardRow(rankNumber: Text("#2"), cryptoSymbol: Text("QWER"), price: Text("$100"), status: Text("(2.89%)"))
                          .previewLayout(.fixed(width: UIScreen.main.bounds.width,
                                                height: UIScreen.main.bounds.height * 0.17))
        }

    }
}
