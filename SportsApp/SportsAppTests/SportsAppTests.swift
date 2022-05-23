//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by Hala Mustafa on 5/22/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import XCTest

@testable import SportsApp

class SportsAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    
   
    func testFetchAllSports() {
         let myExpectation = expectation(description: "Waiting to fetch data from API")
        SportsNetworkService.fetchAllSports { (result)  -> Void in
            guard let sports = (result as? Sports)?.sports else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertEqual(sports.count, 34, "Api Elements Wrong Count")
            myExpectation.fulfill()

        }
        waitForExpectations(timeout: 5, handler: nil)
     }
    

    func testFetchLeagues(){
         let expectationOject = expectation(description: "Waiting for the response")
        SportsNetworkService.fetchLeagues(strSport: "Soccer"){ (result)  -> Void in
        
            guard let leagues = (result as? AllLeagues)?.countries else{
                 XCTFail()
                 expectationOject.fulfill()
                 return
             }
           print("leagues count : \(leagues.count)")
             XCTAssertEqual(leagues.count, 10, "error in API items' count")
             expectationOject.fulfill()
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
        
  
    func testFetchTeams(){
          let expectationOject = expectation(description: "Waiting for the response")
        SportsNetworkService.fetchTeams(strLeagues: "English Premier League"){ (result)  -> Void in
        
            guard let teams = (result as? AllTeams)?.teams else{
                  XCTFail()
                  expectationOject.fulfill()
                  return
              }
            print("number of teams = \(teams.count)")
              XCTAssertEqual(teams.count, 20, "error in API items' count")
              expectationOject.fulfill()
         }
         waitForExpectations(timeout: 15, handler: nil)
     }
    
    
  
       func testGetEventsByLeagueId(){
             let expectationOject = expectation(description: "Waiting for the response")
        SportsNetworkService.getEventsByLeagueId(leagueId: "4328"){ (result)  -> Void in
            guard let events = (result as? AllEvents)?.events else{
                     XCTFail()
                     expectationOject.fulfill()
                     return
                 }
               print("number of events = \(events.count)")
                 XCTAssertEqual(events.count, 100, "error in API items' count")
                 expectationOject.fulfill()
            }
            waitForExpectations(timeout: 15, handler: nil)
        }
    
    func testGetLatestResultsByLeagueId(){
               let expectationOject = expectation(description: "Waiting for the response")
        SportsNetworkService.getLatestResultsByLeagueId(leagueId: "4328"){ (result)  -> Void in
              guard let events = (result as? AllResults)?.events else{
                       XCTFail()
                       expectationOject.fulfill()
                       return
                   }
                 print("number of events = \(events.count)")
                   XCTAssertEqual(events.count, 100, "error in API items' count")
                   expectationOject.fulfill()
              }
              waitForExpectations(timeout: 15, handler: nil)
          }
}
