//
//  CircleImage.swift
//  Crypto Headlines
//
//  Created by Joshua Geronimo on 11/17/19.
//  Copyright © 2019 Joshua Geronimo. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("profile_picture"))
    }
}
