//
//  ProductCell.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 24.08.2022.
//

import UIKit

class ProductCell : UICollectionViewCell {
    
    //MARK: - PROPERTIES
    
     let productImage : UIImageView = {
         let iv = UIImageView()
         iv.backgroundColor = .systemGray6
         iv.translatesAutoresizingMaskIntoConstraints = false
         iv.contentMode = .scaleAspectFit
         iv.clipsToBounds = true
        return iv
    }()
    
     let priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
     let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
     let locationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .ultraLight)
        return label
    }()
    
    
    //MARK: - LIFECYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - HELPERS
    
    
    func configureCell() {
        backgroundColor = .white
        
        addSubview(productImage)
        productImage.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0)
        productImage.setHeight(70)
        
        addSubview(priceLabel)
        priceLabel.anchor(top: productImage.bottomAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 4)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: priceLabel.bottomAnchor, left: leftAnchor, paddingTop: 0, paddingLeft: 4)
        
        addSubview(locationLabel)
        locationLabel.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 8)
        
    }
    
    
    
    
    
}
