//
//  TeamsDetailsViewController.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/17/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit

class TeamsDetailsViewController: UIViewController {

    var team : Team!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var teamBadgeImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var tShirtImage: UIImageView!
    
    
    var facebook =   "https://\(team.strFacebook)"
    var facebookURL = URL(string: facebook)!
    var twitter = "https://\(team.strTwitter)"
    var twitterURL = URL(string: twitter)!
    var website = "https://\(team.strWebsite)"
    var websiteURL = URL(string: website)!
    var instgram = "https://\(team.strInstagram)"
    var instgramURL = URL(string: instgram)!
    
    @IBAction func facebookButton(_ sender: Any) {
        
        if UIApplication.shared.canOpenURL(facebookURL) {
                  UIApplication.shared.open(facebookURL)
        } else {
            //redirect to safari because the user doesn't have Instagram
             UIApplication.shared.open(URL(string: "https://www.facebook.com/")!)
        }
        
    }
    
    
    @IBAction func instgramButton(_ sender: Any) {
        
        if UIApplication.shared.canOpenURL(instgramURL) {
            UIApplication.shared.open(instgramURL)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(URL(string: "http://instagram.com/")!)
        }
        
    }
    
    @IBAction func twitterButton(_ sender: Any) {
        
        if UIApplication.shared.canOpenURL(twitterURL) {
            UIApplication.shared.open(twitterURL)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(URL(string: "https://www.twitter.com/")!)
        }
    }
    
    @IBAction func googleButton(_ sender: Any) {
        
        if UIApplication.shared.canOpenURL(websiteURL) {
            UIApplication.shared.open(websiteURL)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(URL(string: "https://www.google.com/")!)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.kf.setImage(with: URL(string : (team.strTeamFanart4)), placeholder: nil, options: nil, progressBlock: nil)
        teamBadgeImage.kf.setImage(with: URL(string : (team.strTeamBadge)), placeholder: nil, options: nil, progressBlock: nil)
        tShirtImage.kf.setImage(with: URL(string : (team.strTeamJersey)), placeholder: nil, options: nil, progressBlock: nil)
        
        teamName.text = team.strTeam
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
