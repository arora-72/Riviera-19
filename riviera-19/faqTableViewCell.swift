//
//  faqTableViewCell.swift
//  riviera-19
//
//  Created by Indresh Arora on 02/02/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class faqTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var ansTitle: UITextView!
    
    
    
}
