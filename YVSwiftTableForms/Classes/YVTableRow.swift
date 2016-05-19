//
//  YVTableRow.swift
//  YVSwiftTableForms
//
//  Created by Yash on 09/05/16.
//  Copyright © 2016 Yash. All rights reserved.
//

import UIKit

public enum YVRowType: String {
    case TextOnlyInput, LabelTextInput, Button, Label
}

public enum YVInputValidationType: String {
    case NumberOnly, AlphobetOnly, NoSpecialChar, LimitedChars
}

public class YVTableRow: NSObject {
    
    public var type: YVRowType = YVRowType.TextOnlyInput
    public var text: String?
    public var value: String?
    public var indexPath: NSIndexPath?
    public var height: CGFloat?
    public var inputTextColor: UIColor?
    public var inputTextFont: UIFont?
    public var inputTextAlignment: NSTextAlignment?
    public var textFieldBorderStyle : UITextBorderStyle?
    public var validationType: YVInputValidationType?
    public var numberOfCharectersToBeRestricted: Int?
    public var textFont: UIFont?
    public var textColor: UIColor?
    public var textAlignment: NSTextAlignment?
    public var backgroundColor: UIColor?
    public var backgroundImageName: String?
    public var separatorImageName: String?
    public var separatorColor: UIColor?
    
    public override init() {
        super.init()
    }
}
