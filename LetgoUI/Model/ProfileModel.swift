//
//  ProfileModel.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 27.08.2022.
//

import UIKit

struct ProfileModel {
    
    let icon: String
    let title : String
    let subtitle : String
    
    init(icon: String, title: String, subtitle : String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
    
}
