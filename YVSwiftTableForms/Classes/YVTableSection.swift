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

public class YVTableSection: NSObject {
    public var text: String?
    public var height: CGFloat?
    public var textFont: UIFont?
    public var textColor: UIColor?
    public var textAlignment: NSTextAlignment?
    public var backgroundColor: UIColor?
    public var backgroundImageName: String?
    public var separatorImageName: String?
}
