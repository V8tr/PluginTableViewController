//
//  NibCell.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 12/5/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import UIKit

class NibCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
