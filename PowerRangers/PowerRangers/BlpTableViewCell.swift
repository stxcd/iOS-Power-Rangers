//
//  BlpTableViewCell.swift
//  PowerRangers
//
//  Created by Zack on 11/20/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class BlpTableViewCell: UITableViewCell {

    
    //Cell Labels
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var housingIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
