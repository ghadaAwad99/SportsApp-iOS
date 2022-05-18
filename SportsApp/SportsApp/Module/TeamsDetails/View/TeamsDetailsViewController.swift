//
//  TeamsDetailsViewController.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/17/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit

class TeamsDetailsViewController: UIViewController {

    var team : Teams!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var teamBadgeImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var tShirtImage: UIImageView!
    
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func facebookButton(_ sender: Any) {
        
        let facebook =   "https://\(self.team.strFacebook)"
        let facebookURL = URL(string: facebook)!
        
        if UIApplication.shared.canOpenURL(facebookURL) {
                  UIApplication.shared.open(facebookURL)
        } else {
            //redirect to safari because the user doesn't have Instagram
             UIApplication.shared.open(URL(string: "https://www.facebook.com/")!)
        }
        
    }
    
   
    @IBAction func instgramButton(_ sender: Any) {
        
        let instgram = "https://\(team.strInstagram)"
        let instgramURL = URL(string: instgram)!
        
        if UIApplication.shared.canOpenURL(instgramURL) {
            UIApplication.shared.open(instgramURL)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(URL(string: "http://instagram.com/")!)
        }
        
    }
    
    @IBAction func twitterButton(_ sender: Any) {
        
        let twitter = "https://\(team.strTwitter)"
        let twitterURL = URL(string: twitter)!
        
        if UIApplication.shared.canOpenURL(twitterURL) {
            UIApplication.shared.open(twitterURL)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.open(URL(string: "https://www.twitter.com/")!)
        }
    }
    
    @IBAction func googleButton(_ sender: Any) {
        
        let website = "https://\(team.strWebsite)"
        let websiteURL = URL(string: website)!
        
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
