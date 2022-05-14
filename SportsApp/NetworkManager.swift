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
}

class AllSportsNetworkService  : AllSportsService {
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
}
