//
//  EventModel.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/14/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation


struct AllEvents  :  Decodable {
    let events : [Event]
}

struct Event : Decodable{
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
    //let intHomeScore : String
    //let intAwayScore : String
    let strTimestamp: String?
    let dateEvent:String?
    //let dateEventLocal:String
    let strTime:String?
    //let strTimeLocal:String
    let strThumb : String?
    
    /*"strDescriptionEN":"",
     "strHomeTeam":"KS Teuta",
     "strAwayTeam":"Partizani",
     "intHomeScore":"1",
     "intRound":"1",
     "intAwayScore":"0",
     "intSpectators":null,
     "strOfficial":"",
     "strTimestamp":"2021-09-10T17:45:00+00:00",
     "dateEvent":"2021-09-10",
     "dateEventLocal":"2021-09-11",
     "strTime":"17:45:00",
     "strTimeLocal":"17:00:00",
     "strTVStation":null,
     "idHomeTeam":"134055",
     "idAwayTeam":"137799",
     "intScore":null,
     "intScoreVotes":null,
     "strResult":"",
     "strVenue":"Stadiumi Niko Dovana",
     "strCountry":"Albania",
     "strCity":"",
     "strPoster":"",
     "strSquare":"",
     "strFanart":null,
     "strThumb":"https:\/\/www.thesportsdb.com\/images\/media\/event\/thumb\/omth271639087437.jpg",
     "strBanner":"",
     "strMap":null,
     "strTweet1":"",
     "strTweet2":"",
     "strTweet3":"",
     "strVideo":"",
     "strStatus":"Match Finished",
     "strPostponed":"no",
     "strLocked":"unlocked"*/
}
