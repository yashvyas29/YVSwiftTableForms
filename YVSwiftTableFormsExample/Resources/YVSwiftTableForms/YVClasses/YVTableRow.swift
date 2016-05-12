//
//  YVTableRow.swift
//  YVSwiftTableForms
//
//  Created by Yash on 09/05/16.
//  Copyright © 2016 Yash. All rights reserved.
//

import UIKit

enum YVRowType: String {
    case TextOnlyInput, LabelTextInput, Button, Label
}

enum YVInputValidationType: String {
    case NumberOnly, AlphobetOnly, NoSpecialChar, LimitedChars
}

class YVTableRow: NSObject {
    
    var type: YVRowType = YVRowType.TextOnlyInput
    var text: String?
    var value: String?
    var indexPath: NSIndexPath?
    var height: CGFloat?
    var inputTextColor: UIColor?
    var inputTextFont: UIFont?
    var inputTextAlignment: NSTextAlignment?
    var textFieldBorderStyle : UITextBorderStyle?
    var validationType: YVInputValidationType?
    var numberOfCharectersToBeRestricted: Int?
    var textFont: UIFont?
    var textColor: UIColor?
    var textAlignment: NSTextAlignment?
    var backgroundColor: UIColor?
    var backgroundImageName: String?
    var separatorImageName: String?
    var separatorColor: UIColor?
    
    override init() {
        super.init()
    }
}
