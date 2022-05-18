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
    
    @IBOutlet weak var myLable: UILabel!
    
    var league :Leagues!
    
    // UpComing eventes
    var eventsResponse : [Event] = []
    var presenter : EventsPresenter!
    
    //Latest Results
    
    @IBOutlet weak var latestCollectionView: UICollectionView!
    var latestResultResponse : [LatestResult] = []
    
    // Teams
    var teamsResponse: [Teams] = []
    var teamsPresenter : TeamsPresenter!
    
    @IBAction func addToFavoriteButton(_ sender: UIButton) {
    }
    
   
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // myLable.text = "hdhfdhbdhfbhdhkfhgbhsfhgbfkfhkghfusighdfbvhfkdhsiuhrhuruhhbrwhbgkbrbabflhug;hfagfghbrhuajeirgbbaflbjkgihuhgorahguhgbhbsfvgsblgnriohgrebhgrbhklkkkgkgjkgjgjgjgjgjgjggjjgjggjgjgj"
        // Collection view
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        
        // getting Upcoming eventes data
        presenter = EventsPresenter()
        presenter.getEventsByLeagueId(leagueId: league.idLeague)
        print("id league\(league.idLeague)")
        presenter.getLatestResultsByLeagueId(leagueId: league.idLeague)
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
        
        var returnedSize = CGSize()
        
        if (collectionView == myCollectionView){
            returnedSize =  CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
        }
        if (collectionView == teamesCollectionView){
            returnedSize =  CGSize(width: collectionView.frame.width / 3 , height: collectionView.frame.width / 3)
        }
        if (collectionView == latestCollectionView){
            returnedSize = CGSize(width: collectionView.frame.width / 1.0 , height: collectionView.frame.width / 2.0)
        }
        // return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
        return returnedSize
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return 10
        
        
        // teams collectionView
        // var arrayCount = 0
        if(collectionView == teamesCollectionView){
            print("teams array count : \(self.teamsResponse.count)")
            return  teamsResponse.count
        }
        
        if(collectionView == latestCollectionView){
            print("latestCollectionView array count : \(self.latestResultResponse.count)")
            return latestResultResponse.count
        }
        
        print("array count : \(self.eventsResponse.count)")
        
        //arrayCount =  self.eventsResponse.count
        
        
        return  self.eventsResponse.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if (collectionView == myCollectionView){
            
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventsCustomCell
            
            let event = eventsResponse[indexPath.row]
            
            //cell.eventNameLable.text = event.strEvent
            cell.dateLable.text = event.dateEvent
            cell.timeLable.text = event.strTime
            
            cell.eventImage.layer.cornerRadius = 15
            cell.eventImage.layer.masksToBounds = true
            
            cell.eventImage.kf.setImage(with: URL(string: event.strThumb))
            
            return cell
        }
        
        if (collectionView == latestCollectionView){
            let resultCell = latestCollectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! LatestResultCustomCell
            
            
            let result = latestResultResponse[indexPath.row]
            
            //resultCell.homeTeamLable.text = result.strAwayTeam
                
           // resultCell.resultImage.layer.cornerRadius = resultCell.resultImage.frame.size.width / 9.0
           // resultCell.resultImage.layer.masksToBounds = true
            
            resultCell.homeTeamScore.font = UIFont.boldSystemFont(ofSize: resultCell.homeTeamScore.font.pointSize)
         resultCell.awayTeamScore.font = UIFont.boldSystemFont(ofSize: resultCell.homeTeamScore.font.pointSize)
         
            resultCell.awayTeamScore.text = result.intAwayScore
            resultCell.homeTeamScore.text = result.intHomeScore
            
            resultCell.resultImage.kf.setImage(with: URL(string: result.strThumb ))
            
            return resultCell
            
        }
        // teames collection view
        if(collectionView == teamesCollectionView){
            
            let teamsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as! TeamsCollectionViewCell
            
            let item = teamsResponse[indexPath.row]
            //  cell.teameName.text = item.strTeam
            let imageUrl = item.strTeamBadge
            teamsCell.teamBadgeImage.kf.setImage(with: URL(string : imageUrl), placeholder: nil, options: nil, progressBlock: nil)
            
            return teamsCell
        }
        
        return cell1
    }
    
    
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   
            if(collectionView == teamesCollectionView){
                
            let main = UIStoryboard(name: "Main", bundle: nil)
            let detailsVC = main.instantiateViewController(withIdentifier: "teamsDetailsVC") as! TeamsDetailsViewController
                   
            detailsVC.modalPresentationStyle = .fullScreen
            detailsVC.team = teamsResponse[indexPath.row]
            self.present(detailsVC, animated: true, completion: nil)
            
           }
    }
    
}

// protocols and confirmation
extension EventsViewController : EventsViewProtocol  , TeamsViewProtocol {
    
    func renderCollectionView() {
        self.eventsResponse = presenter.result ?? []
        self.latestResultResponse = presenter.latestResult ?? []
        myCollectionView.reloadData()
        latestCollectionView.reloadData()
    }
    
    func renderTeamesCollectionView(){
        self.teamsResponse = teamsPresenter.result
        teamesCollectionView.reloadData()
    }
}
