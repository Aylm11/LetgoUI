//
//  HomeController.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 24.08.2022.
//

import UIKit

class HomeController : UICollectionViewController {
    
    //MARK: - PROPERTIES
    
    let name = "HomeController"
    
    let productArray : [ProductModel] = [ProductModel(imageName: "iphone", price: "29.850 TL", description: "iPhone 13 Pro", location: "İstanbul"),ProductModel(imageName: "opel", price: "442.000 TL", description: "Opel Astra", location: "İzmir"),ProductModel(imageName: "koltuk", price: "7.000 TL", description: "Koltuk Takımı", location: "Kayseri"),ProductModel(imageName: "motorr", price: "120.000 TL", description: "Motorsiklet", location: "Ankara"),ProductModel(imageName: "watch", price: "6.000 TL", description: "Apple Watch 7", location: "Antalya")]
    
    private let searchController = UISearchController(searchResultsController: nil)

    //MARK: - LIFECYCLE
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.init(collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureSearchController()
        configureCollectionViews()
    }
    
    //MARK: - HELPERS
    
    func configureCollectionViews(){
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "productcell")
        collectionView.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        
        let image = UIImageView()
        image.image = UIImage(named: "pin")
        image.contentMode = .scaleAspectFill
        
        let img = image.image
        
        let button = UIButton(type: .system)
        button.setImage(img, for: .normal)
        button.tintColor = .lightGray
        button.setTitle(" Adalar, İstanbul", for: .normal)
        
        
        let customBarButton = UIBarButtonItem(customView: button)
        let button2 = UIButton()
        button2.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button2.tintColor = .lightGray
        let customBarButton2 = UIBarButtonItem(customView: button2)
        
        navigationItem.leftBarButtonItems = [customBarButton,customBarButton2]
        
    }
    
    func configureSearchController() {
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Araba, telefon, bisiklet ve daha fazlası..."
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.showsCancelButton = false
        definesPresentationContext = false
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.systemFont(ofSize: 14)
        
    }
    
}

//MARK: -UICollectionViewDelegateFlowLayout

extension HomeController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 25) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 420)
    }
}

//MARK: -UICollectionViewDataSource

extension HomeController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productcell", for: indexPath) as! ProductCell
        cell.locationLabel.text = productArray[indexPath.row].location
        cell.priceLabel.text = productArray[indexPath.row].price
        cell.descriptionLabel.text = productArray[indexPath.row].description
        cell.productImage.image = UIImage(named: productArray[indexPath.row].imageName)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HomeHeader
        return header
    }
}

