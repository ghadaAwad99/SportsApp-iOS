//
//  CustomTableViewCell.swift
//  SportsApp
//
//  Created by Narges Nagy on 5/12/22.
//  Copyright © 2022 Hala Mustafa. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
   
    @IBOutlet weak var cellYoutubeButton: UIButton!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
