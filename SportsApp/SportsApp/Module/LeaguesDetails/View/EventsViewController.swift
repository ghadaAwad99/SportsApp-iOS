//
//  EventsViewController.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/15/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit

class EventsViewController:UIViewController, EventsViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
         
         return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
     }
    
    var eventsResponse : [Event] = []
    var presenter : EventsPresenter!
    
    override func viewDidLoad() {
         super.viewDidLoad()

         // Do any additional setup after loading the view.
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
         
         presenter = EventsPresenter()
         presenter.getEventsByLeagueId(leagueId: "4617")
            
         presenter.attachView(view: self)
     }
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return 10
         print("array count : \(self.eventsResponse.count)")
        return self.eventsResponse.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventsCustomCell
        
        cell.eventNameLable.text = eventsResponse[indexPath.row].strEvent
        
        return cell
    }
    
    
    func renderCollectionView() {
        self.eventsResponse = presenter.result
          myCollectionView.reloadData()
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
