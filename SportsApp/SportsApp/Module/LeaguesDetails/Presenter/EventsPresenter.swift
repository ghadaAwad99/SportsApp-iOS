//
//  EventsPresenter.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/14/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
class EventsPresenter {
    
    var view : EventsViewController!
    
    var result : [Event]?
    
    var latestResult : [LatestResult]?
    
    func attachView(view: EventsViewController){
        self.view = view
    }
    
   // let network = SportsNetworkService()
    
    func getEventsByLeagueId(leagueId : String){
        print("inside events presenter")
        SportsNetworkService.getEventsByLeagueId(leagueId: leagueId, completionHandler: {
            [weak self] (response) in
            guard let response = response else {return print("else")}
            self?.result = response.events
            print("response presener " + response.events[0].idEvent)
            
            DispatchQueue.main.async {
                self?.view.renderCollectionView()
            }
        })
        
      
    }
    
    func getLatestResultsByLeagueId(leagueId: String){
        SportsNetworkService.getLatestResultsByLeagueId(leagueId: leagueId, completionHandler: {
            [weak self] (response) in
            guard let response = response else {return print("else")}
            self?.latestResult = response.events
            print("response presener " + response.events[0].idEvent)
            
            DispatchQueue.main.async {
                self?.view.renderCollectionView()
            }
        })
    }
}
