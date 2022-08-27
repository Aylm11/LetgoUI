//
//  HomeHeader.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 25.08.2022.
//

import UIKit

class HomeHeader : UICollectionReusableView {
    
    //MARK: - PROPERTIES
    
    let categoryArray : [CategoryModel] = [CategoryModel(imageName: "car", label: "ARABA"),CategoryModel(imageName: "phone", label: "TELEFON"),CategoryModel(imageName: "home", label: "EV EŞYALARI"),CategoryModel(imageName: "elekto", label: "ELEKTRONİK"),CategoryModel(imageName: "motor", label: "MOTORSİKLET"),CategoryModel(imageName: "truck", label: "DİĞER ARAÇLAR"),CategoryModel(imageName: "baby", label: "BEBEK VE ÇOCUK"),CategoryModel(imageName: "spor", label: "SPOR VE OUTDOOR"),CategoryModel(imageName: "headphone", label: "HOBİ VE EĞLENCE"),CategoryModel(imageName: "woman", label: "GİYİM VE AKSESUAR") ]
    
    private let imageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "img")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let redButton1 : UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemRed
        button.setTitle("Araba al", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 40/2
        button.setDimensions(height: 40, width: 160)
        return button
    }()
    
    private let redButton2 : UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemRed
        button.setTitle("Araba sat", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 40/2
        button.setDimensions(height: 40, width: 160)
        return button
    }()
    
    private let categoriesCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CategoriesCell.self, forCellWithReuseIdentifier: "categorycell")
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    
    private let sectionLabel1 : UILabel = {
        let label = UILabel()
        label.text = "Kategorilere Göz At"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let sectionLabel2 : UILabel = {
        let label = UILabel()
        label.text = "Güncel İlanlar"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    //MARK: - LIFECYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        categoriesCV.delegate = self
        categoriesCV.dataSource = self
        
        configureHeader()

        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - HELPERS
    
    func configureHeader(){
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor , left: leftAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10, width: UIScreen.main.bounds.width - 70, height: 180)
        
        
        imageView.addSubview(redButton1)
        
        redButton1.anchor(left:imageView.leftAnchor, bottom: imageView.bottomAnchor, paddingLeft: 10, paddingBottom: 10)
        
        imageView.addSubview(redButton2)
        
        redButton2.anchor( bottom: imageView.bottomAnchor,right: imageView.rightAnchor , paddingBottom: 10, paddingRight: 10)
        
        addSubview(sectionLabel1)
        sectionLabel1.anchor(top: imageView.bottomAnchor, left: leftAnchor, paddingTop: 35, paddingLeft: 10)
        
        configureCollectionView()
        
        addSubview(sectionLabel2)
        sectionLabel2.anchor(top:categoriesCV.bottomAnchor, left: leftAnchor, paddingTop: 0, paddingLeft: 10)
    }
   
    
    func configureCollectionView() {
        
        addSubview(categoriesCV)
        
        categoriesCV.anchor(top:sectionLabel1.bottomAnchor ,left: leftAnchor,right: rightAnchor,paddingTop: 15 ,paddingLeft: 0,paddingRight: 0)
        
        categoriesCV.setHeight(140)
    }
    
    
}
extension HomeHeader : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            return CGSize (width: collectionView.frame.width / 3.5 , height: collectionView.frame.width / 2.5)
        
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categoryArray.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categorycell", for: indexPath) as! CategoriesCell
            cell.categoryImage.image = UIImage(named: categoryArray[indexPath.row].imageName)
            cell.nameLabel.text = categoryArray[indexPath.row].label
            return cell
    }
}
