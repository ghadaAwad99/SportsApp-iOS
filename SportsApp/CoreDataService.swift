//
//  CoreDataService.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/18/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
import CoreData

protocol LeaguesCoreDataServiceProtocol{

    func saveLeagueToCoreData(leagues : Leagues , appDelegate : AppDelegate )
}

class LeaguesCoreDataService : LeaguesCoreDataServiceProtocol {
    
func saveLeagueToCoreData(leagues : Leagues , appDelegate : AppDelegate ){
    
   
    let context = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "LeaguesData", in: context)
    
    let league = NSManagedObject(entity: entity!, insertInto: context)
    league.setValue(leagues.idLeague, forKey: "idLeague")
    league.setValue(leagues.strLeague, forKey: "strLeague")
    league.setValue(leagues.strSport, forKey: "strSport")
    league.setValue(leagues.strYoutube, forKey: "strYoutube")
    league.setValue(leagues.strBadge, forKey: "strBadge")
    do{
        try context.save()
        print("addedSuccessfully")
    } catch{
        print("error")
    }
    
}

}
