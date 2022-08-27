//
//  ProductModel.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 24.08.2022.
//

import UIKit

struct ProductModel {
    
    let imageName : String
    let price : String
    let description : String
    let location : String
    
    init(imageName : String, price:String, description:String, location:String){
        self.imageName = imageName
        self.price = price
        self.description = description
        self.location = location
    }
    
}
