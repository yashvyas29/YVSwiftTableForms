//
//  YVTableSection.swift
//  YVSwiftTableFormsExample
//
//  Created by Yash on 11/05/16.
//  Copyright © 2016 Yash. All rights reserved.
//

import UIKit

enum YVSectionType {
    case Label, Button
}

class YVTableSection: NSObject {
    var text: String?
    var height: CGFloat?
    var textFont: UIFont?
    var textColor: UIColor?
    var textAlignment: NSTextAlignment?
    var backgroundColor: UIColor?
    var backgroundImageName: String?
    var separatorImageName: String?
}
