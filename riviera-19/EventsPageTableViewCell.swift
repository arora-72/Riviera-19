//
//  EventsPageTableViewCell.swift
//  riviera-19
//
//  Created by Indresh Arora on 10/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class EventsPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var callLabel: UILabel!
    
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    
    @IBOutlet weak var clockImage: UIImageView!
    
    @IBOutlet weak var callImage: UIImageView!
    @IBOutlet weak var venueImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
