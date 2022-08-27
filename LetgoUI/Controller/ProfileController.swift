//
//  ProfileController.swift
//  LetgoUI
//
//  Created by Ali YILMAZ on 24.08.2022.
//

import UIKit

class ProfileController : UITableViewController {
    
    //MARK: - PROPERTIES
    
    let settingsArray : [ProfileModel]  = [ProfileModel(icon: "person.fill", title: "Ağım", subtitle: "Takipçiler, takip edilenler ve arkadaş bulma"), ProfileModel(icon: "creditcard.fill", title: "Siparişlerim ve Faturalandırma", subtitle: "Siparişler, faturalar ve faturalandırma bilgileri"), ProfileModel(icon: "gearshape.fill", title: "Ayarlar", subtitle: "Gizlilik ve çıkış"), ProfileModel(icon: "info.circle.fill", title: "Yardım ve Destek", subtitle: "Yardım merkezi, Şartlar ve Koşullar, Gizlilik Politikası")]
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Hesabım"
        

      

    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "profilecell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        
    }
    
    //MARK: - HELPERS
    
  
    
   
}

extension ProfileController  {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profilecell", for: indexPath) as! ProfileCell
         cell.icon.image = UIImage(systemName: settingsArray[indexPath.row].icon)
         cell.title.text = settingsArray[indexPath.row].title
         cell.info.text = settingsArray[indexPath.row].subtitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return ProfileHeader()
        }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
