//
//  UIColor+Theme.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/16/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import UIKit
import SwiftUI

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }

    static let mainColor = UIColor.rgb(red: 29, green: 35, blue: 41, alpha: 1)
    


}
