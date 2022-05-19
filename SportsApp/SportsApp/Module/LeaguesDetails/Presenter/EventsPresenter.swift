//
//  EventsPresenter.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/14/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
import CoreData


protocol EventepresenterProtocol {
    func attachView(view: EventsViewController)
    func getEventsByLeagueId(leagueId : String)
    func getLatestResultsByLeagueId(leagueId: String)
    func saveLeagues (league : Leagues , appDelegate: AppDelegate )
}

class EventsPresenter : EventepresenterProtocol {
    
    var view : EventsViewController!
    
    var FavoriteView : FavouritesViewController!
    
    var leaguesList : [NSManagedObject]!
    
    var upcomingEvent : [Event]?
    
    var latestResult : [LatestResult]?
    
    let networkService = LeaguesCoreDataService()
    // let network = SportsNetworkService()
    
    func attachView(view: EventsViewController){
        self.view = view
    }
    
    func attachFavoriteView(FavoriteView: FavouritesViewController){
        self.FavoriteView = FavoriteView
    }
    
    
    
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
    
    func saveLeagues (league : Leagues , appDelegate: AppDelegate ) {
        networkService.saveLeagueToCoreData(leagues: league, appDelegate: appDelegate )
    }
    
    func getLeaguesFromCoreData(appDelegate : AppDelegate){
        self.leaguesList = LeaguesCoreDataService.fetchLeaguesFromCoreData(appDelegate: appDelegate)
        
        DispatchQueue.main.async {
            self.FavoriteView.renderTableView()
        }
        
    }
    
    func deleteLeagueFromCoreData(league: NSManagedObject, appDelegate: AppDelegate){
        LeaguesCoreDataService.deleteLeagueFromCoreData(league: league, appDelegate: appDelegate)
    }
    
}
