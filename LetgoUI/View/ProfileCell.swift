//
//  ProfileCell.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 26.08.2022.
//

import UIKit

class ProfileCell : UITableViewCell {
    
    //MARK: - PROPERTIES
    
   
    
    let icon : UIImageView = {
       let iv = UIImageView()
        iv.tintColor = .systemGray
        return iv
    }()
    
    let title : UILabel = {
      let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let info : UILabel = {
      let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    
    
    //MARK: - LIFECYCLE
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - HELPERS
    
    func configureUI() {
        
        addSubview(icon)
        icon.anchor(left: leftAnchor, paddingLeft: 8)
        icon.setDimensions(height: 20, width: 20)
        icon.centerY(inView: contentView)
        
        let stackView = UIStackView(arrangedSubviews: [title, info])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.centerY(inView: icon)
        stackView.anchor(left:icon.rightAnchor, paddingLeft: 12)
        
    }
    
    
}
