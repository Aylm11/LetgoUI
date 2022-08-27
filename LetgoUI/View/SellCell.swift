//
//  SellCell.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 26.08.2022.
//

import UIKit

class SellCell : UICollectionViewCell {
    
    //MARK: - PROPERTIES
    
     let icon: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = .systemGray
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
     let name: UILabel = {
        let name = UILabel()
         name.font = UIFont.systemFont(ofSize: 12)
        return name
    }()
    
    //MARK: - LIFECYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(icon)
        icon.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 50, paddingLeft: 20,paddingRight: 20, width: 40, height: 40)
        
        addSubview(name)
        name.anchor(top: icon.bottomAnchor, paddingTop: 15)
        name.centerX(inView: icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
