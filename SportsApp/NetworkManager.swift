//
//  NetworkManager.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/13/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
import Alamofire

// Network for AllSports (featching data from api)
protocol AllSportsService{
    
    func fetchAllSports(completionHandler: @escaping(Sports?) -> ())
    func getEventsByLeagueId(/*leagueId: String , round: String, year: String , */completionHandler: @escaping(AllEvents?) -> ())
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
    // https://www.thesportsdb.com/api/v1/json/2/eventsround.php?r=38&s=2021-2022&id=4328
    
    func getEventsByLeagueId(/*leagueId: String = "4617", round: String = "38", year: String = "2021-2022",*/ completionHandler: @escaping(AllEvents?) -> ()) {
       // let param : Parameters = ["id" : leagueId, "r" : round, "s": year]
        AF.request("https://www.thesportsdb.com/api/v1/json/2/eventsround.php?r=38&s=2021-2022&id=4328" , method: .get, /*parameters: param,*/ encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: AllEvents.self) { (response) in
                guard let sportsResponse = response.value else {
                    print("else")
                    return }
                completionHandler(sportsResponse)
            //    print("SportsNetworkService " + sportsResponse.events[0].idLeague)
           //     print("SportsNetworkService " + sportsResponse.events[0].strEvent)
        }
    }
}


// Network for Leagues (featching data from api)
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

// Ntwork for Teames (featching data from api)
protocol TeamsService{
    func fetchTeams(strLeagues : String, completionHandler: @escaping(AllTeams?) -> ())
}

class TeamsNetworkService  : TeamsService {
    func fetchTeams( strLeagues : String ,completionHandler: @escaping(AllTeams?) -> Void) {
        
         let baseUrl : String = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?"
        
            let param : Parameters = ["l" : strLeagues ]
            AF.request(baseUrl , method: .get, parameters : param, encoding: URLEncoding.queryString )
            .validate()
            .responseDecodable(of: AllTeams.self) { (response) in
                 
                   guard let TeamsResnse = response.value else { return }
                   completionHandler(TeamsResnse)
                   print(TeamsResnse.teams[0].idLeague)
                  

               }
      
    }
}

