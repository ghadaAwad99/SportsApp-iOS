//
//  AllSportsPresenter.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/13/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import Foundation
class AllSportsPresenter : AllSportsPresenterProtocol {
    
    weak var allSportsView: AllSportsViewProtocol!
    var result : [SportModel]!
    
    func attachView(view: AllSportsViewProtocol) {
        self.allSportsView = view
    }
    
    let network = SportsNetworkService()
    
    func getAllSports() {
        print("inside getAllSports presenter")
        network.fetchAllSports {
            [weak self] (response) in
            guard let response = response else {return}
            print ("AllSportsPresenter " + (response.sports[0].strSport ))
            self?.result = response.sports
            print("result: \(self?.result.count ?? 0)")
            
            DispatchQueue.main.async {
                self?.allSportsView.renderCollectionView()
            }
        }
    }
    
}
