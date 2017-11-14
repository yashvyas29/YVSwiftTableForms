//
//  YVButtonCell.swift
//  YVSwiftTableForms
//
//  Created by Yash on 10/05/16.
//  Copyright © 2016 Yash. All rights reserved.
//

import UIKit

class YVButtonCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imgVwBackground: UIImageView!
    @IBOutlet weak var imgVwSeparator: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
