//
//  TeamsPresenterProtocol.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/16/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
protocol TeamsPresenterProtocol {
    func getTeams(strLeagues : String)
    func attachView(view: TeamsViewProtocol)
}
