//
//  NewsViewModel.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var data = Data()
    
    init(imageUrl: String) {
        // fetch image data and then call didChange
        print(imageUrl)
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}

struct NewsThumbNailImage: View {
    
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

struct NewsCardRow: View {
    var title: Text
    var imageURL: String
    
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
            NewsThumbNailImage(imageUrl: imageURL)
        }
        .padding(.top, 15.0)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NewsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardRow(title: Text("Title"), imageURL: "https://www.ccn.com/wp-content/uploads/2019/11/mason-rudolph.jpg")
    }
}
