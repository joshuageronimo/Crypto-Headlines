//
//  CryptoInfoViewController.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 2/21/18.
//  Copyright © 2018 Joshua Geronimo. All rights reserved.
//

import UIKit

class CryptoInfoViewController: UIViewController {
    
    // This will be the imageView that will contain a gif to the user
    private let gifImageView: UIImageView = {
        let gifURL : String = "https://media0.giphy.com/media/5GoVLqeAOo6PK/200w.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let image = UIImageView(image: imageURL)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}
