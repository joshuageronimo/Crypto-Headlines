//
//  TitleHeaderView.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct TitleHeaderView: View {
    
    var mainTitle: Text
    var subTitle: Text
    
    var body: some View {
        VStack(alignment: .leading) {
                mainTitle
                   .foregroundColor(.white)
                   .font(.title)
                subTitle
                   .foregroundColor(.lightAccentColor)
                   .font(.subheadline)
        }
    }
}

struct TitleHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TitleHeaderView(mainTitle: Text("Geronimo App"),
                        subTitle: Text("developer page"))
    }
}
