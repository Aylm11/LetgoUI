//
//  SellProduct.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 25.08.2022.
//

import UIKit

class SellProduct : UIViewController {
    
    //MARK: - PROPERTIES
    
    
    
    let categoryArray : [CategoryModel] = [CategoryModel(imageName: "car", label: "Araba"),CategoryModel(imageName: "phone", label: "Telefon"),CategoryModel(imageName: "home", label: "Ev Eşyaları"),CategoryModel(imageName: "elekto", label: "Elektronik"),CategoryModel(imageName: "motor", label: "Motosiklet"),CategoryModel(imageName: "truck", label: "Diğer Araçlar"),CategoryModel(imageName: "baby", label: "Bebek ve Çocuk"),CategoryModel(imageName: "more", label: "Tüm kategorileri gör") ]
    
    private let collectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SellCell.self, forCellWithReuseIdentifier: "sellcell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .white
        
        return cv
    }()
    
    //MARK: - LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configureUI()

    }
    
    
    //MARK: - HELPERS
    
    func configureUI(){
        
        view.backgroundColor = .white
        navigationItem.title = "Ne Satıyorsun?"
        
        
        let xButton = UIButton(type: .system)
        xButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        xButton.tintColor = .systemGray
        xButton.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: xButton)
        
        
   
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: -10, paddingLeft: -10, paddingBottom: -10, paddingRight: -10)
        
     
    }
    
    //MARK: - ACTIONS
    
    @objc func dismissPage(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}


extension SellProduct : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height / 4 )
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sellcell", for: indexPath) as! SellCell
        cell.icon.image = UIImage(named: categoryArray[indexPath.row].imageName)
        cell.name.text = categoryArray[indexPath.row].label
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
   
    
    
}
