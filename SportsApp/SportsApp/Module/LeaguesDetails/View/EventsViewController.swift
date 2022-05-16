//
//  EventsViewController.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/15/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit

class EventsViewController : UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var teamesCollectionView: UICollectionView!
    
    
    // UpComing eventes
    var eventsResponse : [Event] = []
    var presenter : EventsPresenter!
    
    // Teams
    var teamsResponse: [Teams] = []
    var teamsPresenter : TeamsPresenter!
    
    override func viewDidLoad() {
         super.viewDidLoad()

        
        // Collection view
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
         
        
        // getting Upcoming eventes data
         presenter = EventsPresenter()
         presenter.getEventsByLeagueId(leagueId: "4617")
         presenter.attachView(view: self)
        
        // getting teams data
        teamsPresenter = TeamsPresenter()
        teamsPresenter.attachView(view: self)
        teamsPresenter.getTeams(strLeagues : "English Premier League")
        
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


// methods for collection view
extension EventsViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
//        if (collectionView == myCollectionView){
//            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
//        }
        if (collectionView == teamesCollectionView){
            return CGSize(width: collectionView.frame.width / 3 , height: collectionView.frame.width / 3)
        }
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)

    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return 10
          print("array count : \(self.eventsResponse.count)")
        // teams collectionView
        if(collectionView == teamesCollectionView){
            return teamsResponse.count
        }
        
         return self.eventsResponse.count
        
     }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventsCustomCell
          
          let event = eventsResponse[indexPath.row]
          
          //cell.eventNameLable.text = event.strEvent
          cell.dateLable.text = event.dateEvent
          cell.timeLable.text = event.strTime
          
          cell.eventImage.layer.cornerRadius = 15
          cell.eventImage.layer.masksToBounds = true
          
          cell.eventImage.kf.setImage(with: URL(string: event.strThumb))
       
        // teames collection view
        if(collectionView == teamesCollectionView){
            
            let teamsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
                    
                     let item = items[indexPath.row]
            //  cell.teameName.text = item.strTeam
                     let imageUrl = item.strTeamBadge
              cell.teamBadgeImage.kf.setImage(with: URL(string : imageUrl), placeholder: nil, options: nil, progressBlock: nil)
               
                     return teamsCell
        }
        
          return cell
      }
    
}

// protocols and confirmation
extension EventsViewController : EventsViewProtocol  , TeamsViewProtocol {
    
    func renderCollectionView() {
           self.eventsResponse = presenter.result
           myCollectionView.reloadData()
       }
    
    func renderTeamesCollectionView(){
        self.teamsResponse = teamsPresenter.result
        teamesCollectionView.reloadData()
    }
}
