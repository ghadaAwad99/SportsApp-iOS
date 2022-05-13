//
//  SportModel.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/13/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation

struct SportModel: Decodable {
  let idSport: String
  let strSport: String
  let strFormat: String
  let strSportThumb: String
  let strSportIconGreen: String
  let strSportDescription: String
  
  /*enum CodingKeys: String, CodingKey {
    case idSport = "sportId"
    case strSport = "sportName"
    case strFormat = "sportFormat"
    case strSportThumb = "sportImage"
    case strSportIconGreen = "sportIcon"
    case strSportDescription = "sportDescription"
  }*/
}
