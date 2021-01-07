//
//  Image.swift
//  Milestone project 4
//
//  Created by Carmen Morado on 1/5/21.
//

import UIKit

class Image: NSObject, Codable {
    var caption: String
    var image: String
    
    init(caption: String, image: String) {
        self.caption = caption
        self.image = image
    }
}
