//
//  NewsThumbnailImage.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/18/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct NewsThumbNailImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: imageLoader.data) ?? UIImage(named: "bitcoin")!)
            .resizable()
            .clipped()
            .cornerRadius(20)
            .padding(.top, -50)
            .shadow(radius: 10)
           .frame(width: nil, height: 150)
    }
}

struct NewsThumbNailImageView_Previews: PreviewProvider {
    static var previews: some View {
        NewsThumbNailImageView(imageUrl: "")
    }
}
