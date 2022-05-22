//
//  LatestResultModel.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/17/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation

struct AllResults  :  Decodable {
    let events : [LatestResult]
}

struct LatestResult : Decodable{
    let idEvent : String?
    let idAPIfootball : String?
    let strEvent : String?
    let strEventAlternate : String?
   let strFilename: String?
    let strSport : String?
    let idLeague : String?
    let strLeague : String?
    let strSeason: String?
    let strHomeTeam :  String?
    let strAwayTeam : String?
    let intHomeScore : String?
    let intAwayScore : String?
    let strTimestamp: String?
    let dateEvent:String?
    //let dateEventLocal:String
    let strTime:String?
    //let strTimeLocal:String
    let strThumb : String?
}
