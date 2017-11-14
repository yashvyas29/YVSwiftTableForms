//
//  YVTableForm.swift
//  YVSwiftTableForms
//
//  Created by Yash on 09/05/16.
//  Copyright © 2016 Yash. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class YVTableForm: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Mark: - iVar or Properties
    
    var tblForm: UITableView? {
        didSet {
            
            assert(tblForm != nil, "Table View Can't be nil.")
            
            tblForm?.delegate = self
            tblForm?.dataSource = self
            
            tblForm?.tableHeaderView = UIView()
            tblForm?.tableFooterView = UIView()
            
            tblForm?.separatorStyle = .none
            
            tblForm?.register(UINib.init(nibName: "YV"+YVRowType.TextOnlyInput.rawValue+"Cell", bundle: nil), forCellReuseIdentifier: YVRowType.TextOnlyInput.rawValue)
            tblForm?.register(UINib.init(nibName: "YV"+YVRowType.LabelTextInput.rawValue+"Cell", bundle: nil), forCellReuseIdentifier: YVRowType.LabelTextInput.rawValue)
            tblForm?.register(UINib.init(nibName: "YV"+YVRowType.Button.rawValue+"Cell", bundle: nil), forCellReuseIdentifier: YVRowType.Button.rawValue)
            tblForm?.register(UINib.init(nibName: "YV"+YVRowType.Label.rawValue+"Cell", bundle: nil), forCellReuseIdentifier: YVRowType.Label.rawValue)
        }
    }
    
    
    var arrSections: [YVTableSection?] = []
    var arrRows: [[YVTableRow?]?] = [[]]
    
    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Mark: - Methods
    
    func appendSection(_ section: YVTableSection?) {
        
        if arrSections.count == 0 && arrRows.count > 0 {
            let arrSection: [YVTableRow?]? = arrRows[0]
            if arrSection?.count > 0 {
                arrSections.append(nil)
            }
        }
        arrSections.append(section)
    }
    
    func updateSection(_ section: YVTableSection?, atIndex: Int) {
        
        if atIndex < arrSections.count {
            
            arrSections[atIndex] = section
            
        } else {
            
            for i in 0...atIndex {
                
                if i >= arrSections.count {
                    if i == atIndex {
                        self.appendSection(section)
                    } else {
                        self.appendSection(nil)
                    }
                }
            }
            
        }
        
    }
    
    func appendRow(_ row: YVTableRow, toSection: Int = 0) {
        
        if arrSections.count == 0 {
            
            let arrSection: [YVTableRow?] = [row]
            arrRows.append(arrSection)
            
        } else if toSection < arrRows.count && arrRows[toSection] != nil {
            
            var arrSection: [YVTableRow?]? = arrRows[toSection]
            arrSection?.append(row)
            arrRows[toSection] = arrSection
            
        } else {
            for i in arrRows.count...toSection {
                if i < toSection {
                    arrRows.append(nil)
                } else { //if (i == toSection) {
                    arrRows.append([row])
                }
                if arrSections.count < arrRows.count {
                    self.appendSection(nil)
                }
            }
        }
        
    }
    
    
    // MARK: - Table View Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        let sections = arrSections.count > 0 ? arrSections.count : 1
        return sections
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if arrRows.count > 0 && section < arrRows.count {
            let arrSection: [YVTableRow?]? = arrRows[section]
            let rows = arrSection?.count > 0 ? arrSection!.count : 0
            return rows
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var arrSection: [YVTableRow?]? = arrRows[indexPath.section]
        let row: YVTableRow = (arrSection?[indexPath.row])!
        row.indexPath = indexPath
        arrSection?[indexPath.row] = row
        arrRows[indexPath.section] = arrSection
        
        let cell: UITableViewCell
        
        switch row.type {
            
        case .TextOnlyInput:
            
            let textOnlyInputCell = tableView.dequeueReusableCell(withIdentifier: YVRowType.TextOnlyInput.rawValue) as! YVTextOnlyInputCell
            textOnlyInputCell.textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
            
            if let text = row.text {
                textOnlyInputCell.textField.placeholder = text
            }
            if let strBackgroundImage = row.backgroundImageName {
                textOnlyInputCell.imgVwSeparator.image = UIImage(named: strBackgroundImage)
            } else if let backgroundColor = row.backgroundColor {
                textOnlyInputCell.backgroundColor = backgroundColor
            }
            if let strSeparatorImage = row.separatorImageName {
                textOnlyInputCell.imgVwSeparator.image = UIImage(named: strSeparatorImage)
            }
            if let textColor = row.textColor {
                textOnlyInputCell.textField.textColor = textColor
            }
            if let textAlignment = row.textAlignment {
                textOnlyInputCell.textField.textAlignment = textAlignment
            }
            if let font = row.textFont {
                textOnlyInputCell.textField?.font = font
            }
            if let separatorColor = row.separatorColor {
                textOnlyInputCell.imgVwSeparator.backgroundColor = separatorColor
            } else {
                textOnlyInputCell.imgVwSeparator.backgroundColor = tblForm?.separatorColor
            }
            
            cell = textOnlyInputCell
            break
            
        case .LabelTextInput:
            
            let labelTextInputCell = tableView.dequeueReusableCell(withIdentifier: YVRowType.LabelTextInput.rawValue) as! YVLabelTextInputCell
            labelTextInputCell.txtValue.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
            
            if let text = row.text {
                labelTextInputCell.lblTitle.text = text
            }
            if let strBackgroundImage = row.backgroundImageName {
                labelTextInputCell.imgVwSeparator.image = UIImage(named: strBackgroundImage)
            } else if let backgroundColor = row.backgroundColor {
                labelTextInputCell.backgroundColor = backgroundColor
            }
            if let strSeparatorImage = row.separatorImageName {
                labelTextInputCell.imgVwSeparator.image = UIImage(named: strSeparatorImage)
            }
            if let textColor = row.textColor {
                labelTextInputCell.lblTitle.textColor = textColor
            }
            if let inputTextColor = row.inputTextColor {
                labelTextInputCell.txtValue.textColor = inputTextColor
            }
            if let textAlignment = row.textAlignment {
                labelTextInputCell.lblTitle.textAlignment = textAlignment
            }
            if let inputTextAlignment = row.inputTextAlignment {
                labelTextInputCell.txtValue.textAlignment = inputTextAlignment
            }
            if let font = row.textFont {
                labelTextInputCell.lblTitle?.font = font
            }
            if let inputTextFont = row.inputTextFont {
                labelTextInputCell.txtValue.font = inputTextFont
            }
            if let separatorColor = row.separatorColor {
                labelTextInputCell.imgVwSeparator.backgroundColor = separatorColor
            } else {
                labelTextInputCell.imgVwSeparator.backgroundColor = tblForm?.separatorColor
            }
            
            cell = labelTextInputCell
            break
            
        case .Button:
            
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: YVRowType.Button.rawValue) as! YVButtonCell
            buttonCell.button.addTarget(self, action: #selector(self.buttonCellAction), for: .touchUpInside)
            
            if let text = row.text {
                buttonCell.button.setTitle(text, for: UIControlState())
            }
            if let strBackgroundImage = row.backgroundImageName {
                buttonCell.imgVwSeparator.image = UIImage(named: strBackgroundImage)
            } else if let backgroundColor = row.backgroundColor {
                buttonCell.backgroundColor = backgroundColor
            }
            if let strSeparatorImage = row.separatorImageName {
                buttonCell.imgVwSeparator.image = UIImage(named: strSeparatorImage)
            }
            if let textColor = row.textColor {
                buttonCell.button.setTitleColor(textColor, for: UIControlState())
            }
            if let textAlignment = row.textAlignment {
                buttonCell.button.titleLabel?.textAlignment = textAlignment
            }
            if let font = row.textFont {
                buttonCell.button.titleLabel?.font = font
            }
            if let separatorColor = row.separatorColor {
                buttonCell.imgVwSeparator.backgroundColor = separatorColor
            } else {
                buttonCell.imgVwSeparator.backgroundColor = tblForm?.separatorColor
            }
            
            cell = buttonCell
            break
            
        case .Label:
            
            let labelCell = tableView.dequeueReusableCell(withIdentifier: YVRowType.Label.rawValue) as! YVLabelCell
            
            if let text = row.text {
                labelCell.textLabel?.text = text
            }
            if let strBackgroundImage = row.backgroundImageName {
                labelCell.imgVwSeparator.image = UIImage(named: strBackgroundImage)
            } else if let backgroundColor = row.backgroundColor {
                labelCell.backgroundColor = backgroundColor
            }
            if let strSeparatorImage = row.separatorImageName {
                labelCell.imgVwSeparator.image = UIImage(named: strSeparatorImage)
            }
            if let textColor = row.textColor {
                labelCell.textLabel?.textColor = textColor
            }
            if let textAlignment = row.textAlignment {
                labelCell.textLabel?.textAlignment = textAlignment
            }
            if let font = row.textFont {
                labelCell.textLabel?.font = font
            }
            if let separatorColor = row.separatorColor {
                labelCell.imgVwSeparator.backgroundColor = separatorColor
            } else {
                labelCell.imgVwSeparator.backgroundColor = tblForm?.separatorColor
            }
            
            cell = labelCell
            break
        }
        
        cell.selectionStyle = .none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section: YVTableSection? = section < arrSections.count ? arrSections[section] : nil
        return section?.text
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        let section: YVTableSection? = section < arrSections.count ? arrSections[section] : nil
        
        if let strBackgroundImage = section?.backgroundImageName {
            headerView.backgroundView!.backgroundColor = UIColor(patternImage: UIImage(named: strBackgroundImage)!)
        } else if let backgroundColor = section?.backgroundColor {
            headerView.backgroundView!.backgroundColor = backgroundColor
        }
        if let textColor = section?.textColor {
            headerView.textLabel?.textColor = textColor
        }
        if let textAlignment = section?.textAlignment {
            headerView.textLabel?.textAlignment = textAlignment
        }
        if let font = section?.textFont {
            headerView.textLabel?.font = font
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let section: YVTableSection? = section < arrSections.count ? arrSections[section] : nil
        if let height = section?.height {
            return height
        } else if let _ = section?.text {
            return 44
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var arrSection: [YVTableRow?]? = arrRows[indexPath.section]
        let row: YVTableRow = (arrSection?[indexPath.row])!
        return row.height != nil ? (row.height)! : 44
    }
    
    
    // MARK: - Actions
    
    @objc func buttonCellAction() {
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let point: CGPoint? = textField.convert(CGPoint.zero, to: self.tblForm)
        let indexPath: IndexPath = self.tblForm!.indexPathForRow(at: point!)!
        
        var arrSection: [YVTableRow?]? = arrRows[indexPath.section]
        let row: YVTableRow = (arrSection?[indexPath.row])!
        row.value = textField.text
        arrSection?[indexPath.row] = row
        arrRows[indexPath.section] = arrSection
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
