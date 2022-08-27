//
//  CategoriesCell.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 24.08.2022.
//

import UIKit

class CategoriesCell : UICollectionViewCell {
    
    //MARK: - PROPERTIES
    
    static let identifier = "CategoriesIdentifier"
    
     let categoryImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "letgo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
     let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "ARABA"
        return label
    }()
    
    //MARK: - LIFECYCLE
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(categoryImage)
        categoryImage.centerX(inView: contentView)
        categoryImage.anchor(top: topAnchor, paddingTop: 10)
        categoryImage.setDimensions(height: 60, width: 60)
        
        
        contentView.addSubview(nameLabel)
        nameLabel.anchor(top:categoryImage.bottomAnchor, paddingTop: 20)
        nameLabel.centerX(inView: contentView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    

    
    
    
}
