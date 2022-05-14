//
//  AllSportsPresenterProtocol.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/13/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
protocol AllSportsPresenterProtocol {
     func getAllSports()
    // weak var allSportsView: AllSportsViewProtocol
     //var result : [SportModel]
     
     func attachView(view: AllSportsViewProtocol)
}
