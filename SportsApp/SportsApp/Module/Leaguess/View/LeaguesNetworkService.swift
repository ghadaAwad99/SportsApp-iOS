//
//  LeaguesNetworkService.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/14/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
import Alamofire

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
