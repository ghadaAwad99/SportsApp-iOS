//
//  EventsPresenter.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/14/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
class EventsPresenter {
    
    var view : EventsViewProtocol!
    var result : [Event]!
    
    func attachView(view: EventsViewProtocol){
        self.view = view
    }
    
    let network = SportsNetworkService()
    
    /*func getEventsByLeagueId(leagueId : String){
        network.getEventsByLeagueId(leagueId: leagueId, completionHandler: { [weak self] in
            guard let response = response else {return}
            self?.result = response.events
            
        })
        
      
    }*/
}
