//
//  ProductsController.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 24.08.2022.
//

import UIKit

class ProductsController : UIViewController {
    
    //MARK: - PROPERTIES
    
    let productArray : [ProductModel] = [ProductModel(imageName: "iphone", price: "29.850 TL", description: "iPhone 13 Pro", location: "İstanbul"),ProductModel(imageName: "opel", price: "442.000 TL", description: "Opel Astra", location: "İzmir"),ProductModel(imageName: "koltuk", price: "7.000 TL", description: "Koltuk Takımı", location: "Kayseri"),ProductModel(imageName: "motorr", price: "120.000 TL", description: "Motorsiklet", location: "Ankara"),ProductModel(imageName: "watch", price: "6.000 TL", description: "Apple Watch 7", location: "Antalya")]
    
    private enum Constants {
        static let segmentedControlHeight: CGFloat = 40
        static let underlineViewColor: UIColor = .systemRed
        static let underlineViewHeight: CGFloat = 2
    }
    
    // Container view of the segmented control
    private lazy var segmentedControlContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        
        // Remove background and divider colors
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        
        // Append segments
        segmentedControl.insertSegment(withTitle: "İlanlarım", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Favoriler", at: 1, animated: true)
        
        // Select first segment by default
        segmentedControl.selectedSegmentIndex = 0
        
        // Change text color and the font of the NOT selected (normal) segment
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)], for: .normal)
        
        // Change text color and the font of the selected segment
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
        
        // Set up event handler to get notified when the selected segment changes
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        // Return false because we will set the constraints with Auto Layout
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    // The underline view below the segmented control
    private lazy var bottomUnderlineView: UIView = {
        let underlineView = UIView()
        underlineView.backgroundColor = Constants.underlineViewColor
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        return underlineView
    }()
    
    private lazy var leadingDistanceConstraint: NSLayoutConstraint = {
        return bottomUnderlineView.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor)
    }()
    
    private let tableView : UITableView = {
        let tv = UITableView()
        tv.register(ProductsCell.self, forCellReuseIdentifier: "prdcell")
        return tv
    }()
    
    
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSegmentedControl()
        configureUI()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
    }
    
    //MARK: - HELPERS
    
    func configureUI(){
        view.backgroundColor = .white
        
        navigationItem.title = "İlanlarım"
        
        
        view.addSubview(tableView)
        tableView.anchor(top: segmentedControlContainerView.bottomAnchor, left:view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingTop: 10,paddingLeft: 5, paddingBottom: 0,paddingRight: 5)
    }
    
    func configureSegmentedControl(){
        view.addSubview(segmentedControlContainerView)
        segmentedControlContainerView.addSubview(segmentedControl)
        segmentedControlContainerView.addSubview(bottomUnderlineView)
        
        // Constrain the container view to the view controller
        let safeLayoutGuide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            segmentedControlContainerView.topAnchor.constraint(equalTo: safeLayoutGuide.topAnchor),
            segmentedControlContainerView.leadingAnchor.constraint(equalTo: safeLayoutGuide.leadingAnchor),
            segmentedControlContainerView.widthAnchor.constraint(equalTo: safeLayoutGuide.widthAnchor),
            segmentedControlContainerView.heightAnchor.constraint(equalToConstant: Constants.segmentedControlHeight)
        ])
        
        // Constrain the segmented control to the container view
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlContainerView.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: segmentedControlContainerView.leadingAnchor),
            segmentedControl.centerXAnchor.constraint(equalTo: segmentedControlContainerView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: segmentedControlContainerView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomUnderlineView.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            bottomUnderlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
            leadingDistanceConstraint,
            bottomUnderlineView.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
        ])
    }
    
    // Change position of the underline
    private func changeSegmentedControlLinePosition() {
        let segmentIndex = CGFloat(segmentedControl.selectedSegmentIndex)
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.leadingDistanceConstraint.constant = leadingDistance
            self?.segmentedControl.layoutIfNeeded()
        })
    }
    
    //MARK: - ACTIONS
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        changeSegmentedControlLinePosition()
    }
    
    @objc func searchButton(){
    }
    
    @objc func editButton(){
    }
}

extension ProductsController : UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prdcell", for: indexPath) as! ProductsCell
        cell.priceLabel.text = productArray[indexPath.row].price
        cell.productImage.image = UIImage(named: productArray[indexPath.row].imageName )
        cell.descriptionLabel.text = productArray[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 265
    }
    
    
    
    
}
