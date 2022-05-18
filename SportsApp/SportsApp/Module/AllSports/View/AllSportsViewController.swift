//
//  AllSportsViewController.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/12/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit
import Kingfisher


class AllSportsViewController: UIViewController{
    
    var sportsResponse : [SportModel] = []
    var presenter : AllSportsPresenter!
    
    
    @IBOutlet weak var myCollectionView: AllSportsCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = AllSportsPresenter()
        presenter.getAllSports()
        
        presenter.attachView(view: self)
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

extension AllSportsViewController :AllSportsViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 40
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
            let secondVC = self.storyboard?.instantiateViewController(identifier: "leagues") as! CustomTableViewController
        secondVC.sportName = sportsResponse[indexPath.row].strSport
                    self.navigationController?.pushViewController(secondVC, animated: true)
       }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sportsResponse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AllSportsCustomCell
        
        cell.myImage.kf.setImage(with: URL(string: sportsResponse[indexPath.row].strSportThumb))
        cell.nameLable.text = sportsResponse[indexPath.row].strSport
        cell.myView.layer.cornerRadius = 10
               cell.myView.backgroundColor = UIColor.white
               cell.myImage.contentMode = .scaleAspectFill
               cell.myImage.layer.cornerRadius = 20
               cell.myImage.layer.masksToBounds = true
        return cell
    }
    
    func renderCollectionView() {
        self.sportsResponse = presenter.result
        myCollectionView.reloadData()
    }
    
}
