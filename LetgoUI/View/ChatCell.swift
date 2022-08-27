//
//  ChatCell.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 25.08.2022.
//

import UIKit

class ChatCell : UITableViewCell {
    
    //MARK: - PROPERTIES

    private let productImage : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "opel")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let clientName : UILabel = {
        let label = UILabel()
        label.text = "ALİ YILMAZ"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let date : UILabel = {
        let label = UILabel()
        label.text = "4 gün önce"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    
    private let info : UILabel = {
        let label = UILabel()
        label.text = "2022 Model Temiz Opel"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let optionsIcon : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "more"), for: .normal)
        button.tintColor = .systemGray
        button.setDimensions(height: 30, width: 30)
        return button
    }()
    
    
    
    //MARK: - LIFECYLCE
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - HELPERS
    
    func configureUI(){
        
        addSubview(productImage)
        productImage.anchor(left:leftAnchor, paddingLeft: 4, width: 70,height: 70)
        productImage.centerY(inView: contentView)
        
        addSubview(clientName)
        clientName.anchor(top:topAnchor ,left: productImage.rightAnchor,paddingTop: 35, paddingLeft: 8)
        
        
        addSubview(date)
        date.anchor(top:topAnchor, right: rightAnchor, paddingTop: 10, paddingRight: 30)
        
        addSubview(info)
        info.anchor(top:clientName.bottomAnchor, left: productImage.rightAnchor, paddingTop: 6,paddingLeft: 8)
   
        
        addSubview(optionsIcon)
        optionsIcon.anchor(right: rightAnchor, paddingRight: 10)
        optionsIcon.centerY(inView: contentView)
        
    }
    
    
    
}
