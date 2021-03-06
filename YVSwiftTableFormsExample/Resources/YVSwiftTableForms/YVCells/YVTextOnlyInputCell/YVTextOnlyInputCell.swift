//
//  YVTextOnlyInputCell.swift
//  YVSwiftTableForms
//
//  Created by Yash on 10/05/16.
//  Copyright © 2016 Yash. All rights reserved.
//

import UIKit

class YVTextOnlyInputCell: UITableViewCell {

    @IBOutlet weak var imgVwBackground: UIImageView!
    @IBOutlet weak var imgVwSeparator: UIImageView!
    @IBOutlet weak var textField: YVTextFieldValidator!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
