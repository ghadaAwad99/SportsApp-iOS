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
    
    static func fetchAllSports(completionHandler: @escaping(Sports?) -> ())
    static func getEventsByLeagueId(leagueId: String , completionHandler: @escaping(AllEvents?) -> ())
    static func getLatestResultsByLeagueId(leagueId: String , completionHandler: @escaping(AllResults?) -> ())
    static func fetchLeagues(strSport : String, completionHandler: @escaping(AllLeagues?) -> ())
    static func fetchTeams(strLeagues : String, completionHandler: @escaping(AllTeams?) -> ())
}

class SportsNetworkService  : AllSportsService {
    
    
    static func fetchAllSports(completionHandler: @escaping(Sports?) -> ()) {
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
    
    static func getEventsByLeagueId(leagueId: String, completionHandler: @escaping(AllEvents?) -> ()) {
        let param : Parameters = ["id" : leagueId]
        AF.request("https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?" , method: .get, parameters: param, encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: AllEvents.self) { (response) in
                guard let sportsResponse = response.value else {
                    print("else")
                    return }
                completionHandler(sportsResponse)
        }
    }
    
    static func getLatestResultsByLeagueId(leagueId: String,completionHandler: @escaping (AllResults?) -> ()) {
        let param : Parameters = ["id" : leagueId]
        AF.request("https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?" , method: .get, parameters: param, encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: AllResults.self) { (response) in
                guard let sportsResponse = response.value else {
                    print("else")
                    return }
                completionHandler(sportsResponse)
        }
    }
    
    // Network for Leagues (featching data from api)
    
    static func fetchLeagues( strSport:String ,completionHandler: @escaping(AllLeagues?) -> Void) {
        
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
    
    // Ntwork for Teames (featching data from api)
    static func fetchTeams(strLeagues : String ,completionHandler: @escaping(AllTeams?) -> Void) {
        
        let baseUrl : String = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?"
        
        let param : Parameters = ["l" : strLeagues ]
        AF.request(baseUrl , method: .get, parameters : param, encoding: URLEncoding.queryString )
            .validate()
            .responseDecodable(of: AllTeams.self) { (response) in
                
                guard let TeamsResnse = response.value else { return }
                completionHandler(TeamsResnse)
                print(TeamsResnse.teams[0].idTeam)
                
        }
    }
    
}





