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

     var coun = ["jjjjhh" , "reree" , "uiuiuiu"]
    @IBOutlet weak var tableView: UITableView!
    
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
extension CustomTableViewController : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coun.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        let country =  coun[indexPath.row]
        cell.cellLable.text = country
       // cell.cellImage.image = UIImage(named : "xmen.jpeg")
        cell.cellImage.kf.setImage(with: URL(string :"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIcxm1tSJphluNimxurlape3Q9nhLcX3_apA&usqp=CAU"), placeholder: nil, options: nil, progressBlock: nil)
        
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        cell.cellImage.layer.cornerRadius = cell.cellImage.frame.height / 2
        cell.imageView?.clipsToBounds = true
        
       // cell.cellImage.layer.cornerRadius = cell.cellImage.frame.width / 2
        return cell
        
    }
}
