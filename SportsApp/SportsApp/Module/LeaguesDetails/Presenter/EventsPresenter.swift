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
    
    var upcomingEvent : [Event]?
    
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
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "yyyy-MM-dd"
            let filterdResponse = response.events.filter { formatter.date(from:$0.dateEvent) ?? Date()  > Date()}
            self?.upcomingEvent = filterdResponse
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
