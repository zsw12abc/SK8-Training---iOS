//
//  Product.swift
//  SK8 Training
//
//  Created by Shaowei Zhang on 15/7/21.
//  Copyright © 2015年 Shaowei Zhang. All rights reserved.
//

import UIKit

class Product: NSObject {
    var id: String
    var image: String
    var title: String
    var info: String
    var price: Int
    var num: Int
    
    init (id: String, image: String, title:String, price: Int, info: String, num: Int){
        self.id = id
        self.image = image
        self.title = title
        self.price = price
        self.info = info
        self.num = num
    }
}