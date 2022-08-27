//
//  ProductsCell.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 26.08.2022.
//

import UIKit

class ProductsCell : UITableViewCell {
    
    //MARK: - PROPERTIES
    
    let grayDivider : UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let grayDivider2 : UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let grayDivider3 : UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let redView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    let dateView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.text = "YAYINLANMA TARIHI : 11 EYL 2022"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    let productImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "opel")
        iv.backgroundColor = .systemGray6
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "422.000 TL"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "Opel Astra 2022 HATASIZ !!"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let viewLabel : UIButton = {
        let button = UIButton(type:.system)
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setTitle("Görüntülemeler: 1", for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.tintColor = .systemGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return button
    }()
    
    let likeLabel : UIButton = {
        let button = UIButton(type:.system)
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.setTitle("Beğeniler: 1", for: .normal)
        button.tintColor = .systemGray
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return button
    }()
    
    let whiteDivider : UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    
    
    
    //MARK: - LIFECYCLE
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - HELPERS
    
    
    func configureCell() {
        backgroundColor = .white
        
        addSubview(redView)
        redView.anchor(left: leftAnchor, paddingLeft: 0, width: 3, height: 250)
        redView.centerY(inView: contentView)
        
        
        addSubview(grayDivider)
        grayDivider.anchor(top:topAnchor,paddingTop: 0,width: UIScreen.main.bounds.width - 10, height: 3)
        grayDivider.centerX(inView: contentView)
        
        addSubview(dateView)
        
        dateView.anchor(top: grayDivider.bottomAnchor, left: redView.rightAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, width: contentView.frame.width , height: 30)
        
        dateView.addSubview(dateLabel)
        
        dateLabel.anchor(left:dateView.leftAnchor, paddingLeft: 4)
        dateLabel.centerY(inView: dateView)
        
        addSubview(productImage)
        
        productImage.anchor(top: dateView.bottomAnchor, left: redView.rightAnchor, paddingTop: 8, paddingLeft: 8)
        productImage.setHeight(100)
        productImage.setWidth(100)
        
        let stackView = UIStackView(arrangedSubviews: [viewLabel, likeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        
        let stackView2 = UIStackView(arrangedSubviews: [descriptionLabel, priceLabel,stackView])
        stackView2.axis = .vertical
        stackView2.spacing = 4
        
        addSubview(stackView2)
        stackView2.anchor(top:dateView.bottomAnchor, left: productImage.rightAnchor, paddingTop: 8, paddingLeft: 8)
        
        addSubview(grayDivider3)
        grayDivider3.anchor(top:productImage.bottomAnchor,left:redView.rightAnchor,right: rightAnchor ,paddingTop: 12,paddingLeft: 0,paddingRight: 0,width: UIScreen.main.bounds.width - 13, height: 2)
        
        
        addSubview(whiteDivider)
        whiteDivider.anchor(bottom:bottomAnchor, paddingBottom: 0,width: UIScreen.main.bounds.width , height: 15)
        
        addSubview(grayDivider2)
        grayDivider2.anchor(bottom:whiteDivider.topAnchor, paddingBottom: 0, width: UIScreen.main.bounds.width - 10 , height: 3)
        grayDivider2.centerX(inView: contentView)

   
        
    }
    
    
    
    
    
}

