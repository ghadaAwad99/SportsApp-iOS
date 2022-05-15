//
//  LeaguesPresenter.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/14/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation

class LeaguesPresenter : LeaguesPresenterProtocol {
  
    var result : [Leagues]!
    weak var LeaguesView: LeaguesViewProtocol!
    
    func attachView(view: LeaguesViewProtocol) {
        self.LeaguesView = view
    }
    
    let networkService = LeaguesNetworkService()
    
    func getLeagues(strSport:String) {
        
        networkService.fetchLeagues (strSport: strSport , completionHandler: {
            [weak self] (response) in
            guard let response = response else {return}
            self?.result = response.countries
            print(strSport)
            
            DispatchQueue.main.async {
                self?.LeaguesView.renderTableView()
            }
        })
    }
    
}
