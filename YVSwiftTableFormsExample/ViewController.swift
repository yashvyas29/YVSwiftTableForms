//
//  ViewController.swift
//  YVSwiftTableFormsExample
//
//  Created by Yash on 09/05/16.
//  Copyright © 2016 Yash. All rights reserved.
//

import UIKit

class ViewController: YVTableForm {

    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Register"
        self.tblForm = tableView
        
        var section = YVTableSection()
        section.text = "Personal Details"
//        section.textAlignment = NSTextAlignment.Center
//        section.textColor = UIColor.redColor()
        self.appendSection(section)
        
        var row = YVTableRow()
        row.type = YVRowType.TextOnlyInput
        row.text = "User Name"
        self.appendRow(row)
        
        row = YVTableRow()
        row.type = YVRowType.TextOnlyInput
        row.text = "First Name"  
        self.appendRow(row)
        
        row = YVTableRow()
        row.type = YVRowType.TextOnlyInput
        row.text = "Middle Name"
        self.appendRow(row)
        
        row = YVTableRow()
        row.type = YVRowType.TextOnlyInput
        row.text = "Last Name"
        self.appendRow(row)
        
        row = YVTableRow()
        row.type = YVRowType.TextOnlyInput
        row.text = "Home Email"
        self.appendRow(row)
        
        
        section = YVTableSection()
        section.text = "Professional Details"
//        section.textAlignment = NSTextAlignment.Center
//        section.textColor = UIColor.redColor()
        self.appendSection(section)
        
        row = YVTableRow()
        row.type = YVRowType.TextOnlyInput
        row.text = "Employee Id"
        self.appendRow(row, toSection: 1)
        
        row = YVTableRow()
        row.type = YVRowType.TextOnlyInput
        row.text = "Work Email"
        self.appendRow(row, toSection: 1)
        
        row = YVTableRow()
        row.type = YVRowType.TextOnlyInput
        row.text = "Designation"
        row.separatorColor = UIColor.clear
        self.appendRow(row, toSection: 1)
        
        
        section = YVTableSection()
        section.text = " "
        self.appendSection(section)
        
        row = YVTableRow()
        row.type = YVRowType.Button
        row.text = "Submit"
//        row.textColor = UIColor.redColor()
        row.textFont = UIFont.boldSystemFont(ofSize: 16)
        self.appendRow(row, toSection: 2)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = super.tableView(tableView, cellForRowAt: indexPath);
        if cell.isKind(of: YVTextOnlyInputCell.self) {
            let textInputCell = cell as! YVTextOnlyInputCell
            textInputCell.textField.borderStyle = .bezel
            cell = textInputCell
        }
        return cell;
    }
    
    override func buttonCellAction() {
        super.buttonCellAction()
        for arrSection in self.arrRows {
            if arrSection != nil {
                for row: YVTableRow? in arrSection! {
                    if let text = row?.text, let value = row?.value {
                        print("\(text) : \(value)")
                    } else {
                        if let text = row?.text {
                            print("\(text) : ")
                        } else if let value = row?.value {
                            print(" : \(value)")
                        }
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

