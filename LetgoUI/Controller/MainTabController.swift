//
//  MainTabController.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 24.08.2022.
//

import Foundation
import UIKit


class MainTabController : UITabBarController {
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.delegate = self
    }
    
    //MARK: - HELPERS
    
    func configureUI() {
        
        let home = templateNavigationController(image: UIImage(named: "homepage")!, rootViewController: HomeController())
        home.title = "ANA SAYFA"
        let chat = templateNavigationController(image: UIImage(named: "chat")!, rootViewController: ChatController())
        chat.title = "SOHBETLER"
        let sell = templateNavigationController(image: UIImage(named: "camera")!.withRenderingMode(.alwaysOriginal), rootViewController: SellController())
        sell.title = "SAT"
        sell.tabBarItem.imageInsets = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
        let product = templateNavigationController(image: UIImage(systemName: "heart.fill")!, rootViewController: ProductsController())
        product.title = "İLANLARIM"
        let profile = templateNavigationController(image: UIImage(systemName: "person.fill")!, rootViewController: ProfileController(style: .grouped))
        profile.title = "HESAP"
        
        viewControllers = [home,chat,sell,product,profile]
        
        tabBar.unselectedItemTintColor = .systemGray
        UITabBar.appearance().tintColor = .systemRed
        UITabBar.appearance().backgroundColor = .white
        
    }
    
    func templateNavigationController(image:UIImage,rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.navigationBar.tintColor = .black
        nav.tabBarItem.image = image
        return nav
    }
}

extension MainTabController : UITabBarControllerDelegate {

    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
        if selectedIndex == 2 {
            let controller = UINavigationController(rootViewController: SellProduct())
            controller.modalPresentationStyle = .fullScreen
            self.present(controller.self, animated: true, completion: nil)
        }
       
    
        
    }
}


