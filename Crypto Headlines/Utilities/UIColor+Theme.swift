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
    static let secondaryColor = UIColor.rgb(red: 33, green: 33, blue: 33, alpha: 1)
    static let accentColor = UIColor.rgb(red: 244, green: 178, blue: 178, alpha: 0.76)
    static let positiveColor = UIColor.rgb(red: 172, green: 255, blue: 101, alpha: 1)
    static let negativeColor = UIColor.rgb(red: 255, green: 101, blue: 101, alpha: 1)
}

extension Color {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Color {
        return Color(UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha))
    }
    
    static let mainColor = Color.rgb(red: 29, green: 35, blue: 41, alpha: 1)
    static let secondaryColor = Color.rgb(red: 33, green: 33, blue: 33, alpha: 1)
    
    static let accentColor = Color.rgb(red: 244, green: 178, blue: 178, alpha: 0.76)
    static let positiveColor = Color.rgb(red: 172, green: 255, blue: 101, alpha: 1)
    static let negativeColor = Color.rgb(red: 255, green: 101, blue: 101, alpha: 1)
}
