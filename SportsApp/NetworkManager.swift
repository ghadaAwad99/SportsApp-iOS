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
                guard let sportsResponse = response.value?.events else {
                    print("else")
                    return }
                print(sportsResponse[0].idLeague)
                print(sportsResponse[0].strEvent)
                print(sportsResponse[0].strSport)
                print(sportsResponse[0].strHomeTeam)
                
                print(sportsResponse[0].strAwayTeam)
                print(sportsResponse[0].intHomeScore)
                print(sportsResponse[0].intAwayScore)
                print(sportsResponse[0].dateEvent)
                print(sportsResponse[0].strTime)
        }
    }
}
