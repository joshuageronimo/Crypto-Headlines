//
//  ImageLoader.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/17/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

// This custom UIImageView class will load images from the internet.
class CustomImageView: UIImageView {
    
    var imageUrlString: String? /* reference of the current URL */
    
    func loadImageUsingUrlString(urlString: String) {
        imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        image = nil /* set image to nil while waiting for image to load */
        
        // If the image is in the imageCache already, use that image to avoid reloading of data.
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        // Get the Photo!
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in DispatchQueue.main.async {
            guard let imageToCache = UIImage(data: data!) else { return }
            // Check if the image is going to be loaded in the right cell.
            if self.imageUrlString == urlString {
                self.image = imageToCache
            }
            // cache the image
            imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
        }}).resume()
    }
}
