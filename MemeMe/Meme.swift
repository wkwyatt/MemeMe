//
//  Meme.swift
//  MemeMe
//
//  Created by Will Wyatt on 9/26/15.
//  Copyright (c) 2015 Will Wyatt. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    var top:String
    var bottom:String
    var image:UIImage
    
    init(topText:String, bottomText:String, memeImage:UIImage) {
        top = topText
        bottom = bottomText
        image = memeImage
    }
}