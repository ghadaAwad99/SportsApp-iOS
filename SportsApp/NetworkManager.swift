//
//  NetworkManager.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/13/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
import Alamofire

protocol AllSportsService{
    
    func fetchAllSports(completionHandler: @escaping(Sports?) -> ())
    func getEventsByLeagueId(leagueId: String, completionHandler: @escaping(AllEvents?) -> ())
}

class SportsNetworkService  : AllSportsService {
    func fetchAllSports(completionHandler: @escaping(Sports?) -> ()) {
        print("inside fetch all sports network")
        AF.request("https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
            .validate()
            .responseDecodable(of: Sports.self) { (response) in
                guard let sportsResponse = response.value else { return }
                completionHandler(sportsResponse)
                print("AllSportsNetworkService " + sportsResponse.sports[1].strFormat)
        }
    }
    
    func getEventsByLeagueId(leagueId: String = "4617", completionHandler: @escaping(AllEvents?) -> ()) {
        let param : Parameters = ["id" : leagueId]
        AF.request("https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?" , method: .get, parameters: param, encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: AllEvents.self) { (response) in
                guard let sportsResponse = response.value else {
                    print("else")
                    return }
                completionHandler(sportsResponse)
                print("SportsNetworkService " + sportsResponse.events[0].idLeague)
                print("SportsNetworkService " + sportsResponse.events[0].strEvent)
        }
    }
}



protocol LueguesService{
    func fetchLeagues(strSport : String, completionHandler: @escaping(AllLeagues?) -> ())
}

class LeaguesNetworkService  : LueguesService {
    func fetchLeagues( strSport:String ,completionHandler: @escaping(AllLeagues?) -> Void) {
        
         let baseUrl : String = "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?"
        
            let param : Parameters = ["s" : strSport]
            AF.request(baseUrl , method: .get, parameters: param, encoding: URLEncoding.queryString )
            .validate()
            .responseDecodable(of: AllLeagues.self) { (response) in
                 
                   guard let leaguesResnse = response.value else { return }
                   completionHandler(leaguesResnse)
                   print(leaguesResnse.countries[0].idLeague)
                  

               }
      
    }
}
