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
    var result : [Event]!
    
    func attachView(view: EventsViewController){
        self.view = view
    }
    
    let network = SportsNetworkService()
    
    func getEventsByLeagueId(leagueId : String){
        print("inside events presenter")
        network.getEventsByLeagueId(/*leagueId: leagueId,*/ completionHandler: {
            [weak self] (response) in
            guard let response = response else {return print("else")}
            self?.result = response.events
            print("response presener " + response.events[0].idEvent)
            
            DispatchQueue.main.async {
                self?.view.renderCollectionView()
            }
        })
        
      
    }
}
