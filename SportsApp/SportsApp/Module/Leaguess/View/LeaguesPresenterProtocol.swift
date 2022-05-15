//
//  LeaguesPresenterProtocol.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/14/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation

protocol LeaguesPresenterProtocol {
    func getLeagues(strSport : String)
    func attachView(view: LeaguesViewProtocol)
}
