//
//  AllSportsViewController.swift
//  SportsApp
//
//  Created by Hala Mustafa on 5/12/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit

class AllSportsViewController: UIViewController{

   
       @IBOutlet weak var myCollectionView: AllSportsCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension AllSportsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 25
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AllSportsCustomCell
    
    cell.myImage.image = UIImage(named: "picture.png")
    /*cell.layer.shadowColor = UIColor.lightGray.cgColor
    cell.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    cell.layer.shadowRadius = 10.0
    cell.layer.shadowOpacity = 5.0
    cell.layer.masksToBounds = false
    cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    cell.clipsToBounds = false
    cell.contentView.layer.masksToBounds = true*/
    
        return cell
}

}
