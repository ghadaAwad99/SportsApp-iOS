//
//  NetworkManager.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/13/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
import Alamofire

func fetchAllSports() {
  AF.request("https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
  .validate()
  .responseDecodable(of: Sports.self) { (response) in
      guard let sportsResponse = response.value?.sports else { return }
      print(sportsResponse[0].strSport)
      //self.sportsResponse = sportsResponse
      //self.myCollectionView.reloadData()
  }


}
 
