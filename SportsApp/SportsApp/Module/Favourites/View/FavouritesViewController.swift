//
//  FavouritesViewController.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/18/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import CoreData

class FavouritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // adding style
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false

        // Do any additional setup after loading the view.
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

extension CustomTableViewController : UITableViewDataSource , UITableViewDelegate  {

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "favouritesCell") as! CustomTableViewCell
    
    /*
    let item = items[indexPath.row]
    cell.cellLable.text = item.strLeague
    let imageUrl = item.strBadge
    cell.cellImage.kf.setImage(with: URL(string : imageUrl), placeholder: nil, options: nil, progressBlock: nil)
    
    // cell style
    cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
   /* cell.cellView.layer.shadowOffset = .zero
    cell.cellView.layer.shadowColor = UIColor.lightGray.cgColor
    cell.cellView.layer.opacity = 1
    cell.cellView.layer.shadowRadius = 10
    cell.cellView.backgroundColor = UIColor.lightGray*/
    cell.cellImage.layer.cornerRadius = cell.cellImage.frame.height / 2
    cell.cellImage.layer.cornerRadius = cell.cellImage.frame.width / 2
    cell.imageView?.clipsToBounds = true
    
    */
  
    return cell
    
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    /*
    let main = UIStoryboard(name: "Main", bundle: nil)
    let detailsVC = main.instantiateViewController(withIdentifier: "leaguesDetails") as! EventsViewController
    
    detailsVC.league = items[indexPath.row]
    
    detailsVC.modalPresentationStyle = .fullScreen
    
    self.present(detailsVC, animated: true, completion: nil)
    
    */
}


}
