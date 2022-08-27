//
//  ProfileHeader.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 26.08.2022.
//

import UIKit

class ProfileHeader : UIView {
    
    //MARK: - PROPERTIES
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 16,weight: .bold),
          .foregroundColor: UIColor.systemRed,
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    
    private let profileImage : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "opel")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 40
        iv.clipsToBounds = true
        return iv
    }()
    
    
    private let nameLabel : UILabel = {
       let label = UILabel()
        label.text = "Ali YILMAZ"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        return button
    }()
    
    
    //MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let attributeString = NSMutableAttributedString(
                string: "Profili görüntüle ve düzenle",
                attributes: yourAttributes
             )
        
        button.setAttributedTitle(attributeString, for: .normal)
        
        addSubview(profileImage)
        profileImage.anchor(left: leftAnchor, paddingLeft: 20, width: 80, height: 80)
        profileImage.centerY(inView: self)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, button])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.anchor(left:profileImage.rightAnchor, paddingLeft: 20)
        
        stackView.centerY(inView: profileImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

class UnderlinedLabel: UILabel {

override var text: String? {
    didSet {
        guard let text = text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
        // Add other attributes if needed
        self.attributedText = attributedText
        }
    }
}
