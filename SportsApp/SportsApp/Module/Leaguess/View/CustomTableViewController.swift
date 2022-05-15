//
//  CustomTableViewController.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/12/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class CustomTableViewController: UIViewController {

    var items: [Leagues] = []
    var presenter : LeaguesPresenter!
    
    var sportName : String = ""
  
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // adding style
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        print("sport name in table view \(sportName)")
        
        presenter = LeaguesPresenter()
        presenter.attachView(view: self)
        presenter.getLeagues(strSport:"Soccer")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension CustomTableViewController : UITableViewDataSource , UITableViewDelegate , LeaguesViewProtocol {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        let item = items[indexPath.row]
        cell.cellLable.text = item.strLeague
        let imageUrl = item.strBadge
        cell.cellImage.kf.setImage(with: URL(string : imageUrl), placeholder: nil, options: nil, progressBlock: nil)
        
        // cell style
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.height / 2
        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.width / 2
        cell.imageView?.clipsToBounds = true
        
      
        return cell
        
    }
    
    func renderTableView() {
              self.items = presenter.result
              tableview.reloadData()
          }
}
