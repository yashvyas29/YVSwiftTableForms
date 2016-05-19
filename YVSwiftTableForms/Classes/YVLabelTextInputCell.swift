//
//  YVLabelTextInputCell.swift
//  YVSwiftTableForms
//
//  Created by Yash on 10/05/16.
//  Copyright © 2016 Yash. All rights reserved.
//

import UIKit

public class YVLabelTextInputCell: UITableViewCell {

    @IBOutlet weak public var imgVwBackground: UIImageView!
    @IBOutlet weak public var imgVwSeparator: UIImageView!
    @IBOutlet weak public var lblTitle: UILabel!
    @IBOutlet weak public var txtValue: UITextField!
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
