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
import Network

class FavouritesViewController: UIViewController {
    
    var leaguesList : [NSManagedObject] = []
    var presenter = EventsPresenter()
    
    var appDelegate: AppDelegate!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        presenter.attachFavoriteView(FavoriteView: self)
        // presenter.getLeaguesFromCoreData(appDelegate: appDelegate)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getLeaguesFromCoreData(appDelegate: appDelegate)
    }
    
    func renderTableView(){
        self.leaguesList = presenter.leaguesList
        tableView.reloadData()
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

extension FavouritesViewController : UITableViewDataSource , UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("array leagus count: \(leaguesList.count)")
        return leaguesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouritesCell") as! FavouritesTableViewCell
        
        
        let item = leaguesList[indexPath.row]
        cell.cellLable.text = item.value(forKey: "strLeague") as? String
        cell.cellImage.kf.setImage(with: URL(string : item.value(forKey: "strBadge") as! String), placeholder: nil, options: nil, progressBlock: nil)
        
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
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("You are Online!")
                let main = UIStoryboard(name: "Main", bundle: nil)
                let detailsVC = main.instantiateViewController(withIdentifier: "leaguesDetails") as! EventsViewController
                
                detailsVC.league.idLeague = (self.leaguesList[indexPath.row].value(forKey: "idLeague") as? String)!
                
                detailsVC.modalPresentationStyle = .fullScreen
                
                self.present(detailsVC, animated: true, completion: nil)
            } else{
                print("You Are Offline.")
                //show alert
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteLeagueFromCoreData(league:leaguesList[indexPath.row] , appDelegate: appDelegate )
            leaguesList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
