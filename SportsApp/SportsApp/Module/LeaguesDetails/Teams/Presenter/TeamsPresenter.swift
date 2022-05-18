//
//  TeamsPresenter.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/16/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation

class TeamsPresenter : TeamsPresenterProtocol {
  
    var result : [Teams]!
    weak var TeamsView: TeamsViewProtocol!
    
    func attachView(view: TeamsViewProtocol) {
        self.TeamsView = view
    }
    
    //let networkService = TeamsNetworkService()
    
    func getTeams(strLeagues : String) {
        
        SportsNetworkService.fetchTeams(strLeagues: strLeagues , completionHandler: {
            [weak self] (response) in
            guard let response = response else {return}
            self?.result = response.teams
            print(strLeagues)
            
            DispatchQueue.main.async {
                self?.TeamsView.renderTeamesCollectionView()
            }
        })
    }
    
}
