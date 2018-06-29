//
//  SchoolSelectorViewController.swift
//  Scholarli
//
//  Created by Kyle Papili on 6/18/18.
//  Copyright © 2018 Scholarli. All rights reserved.
//

import UIKit

class SchoolSelectorViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    var listOfSchools : [School]? = []
    var currentSelection : School? = nil
    var pageVC : SignUpPageViewController?
    
    @IBOutlet var SchoolPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSchoolList { (schoolList) in
            if let list = schoolList {
                self.listOfSchools = list
                self.SchoolPicker.reloadAllComponents()
            } else {
                print("ERROR")
                //Error to be handled
            }
        }
    }
    
    func updateNewUser() {
        newUserData["school"] = currentSelection
        print(newUserData)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let skewls = listOfSchools {
            return skewls.count
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let skewls = listOfSchools {
            return skewls[row].displayName
        } else {
            return "Loading..."
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let skewls = listOfSchools {
            self.currentSelection = skewls[row]
        }
        updateNewUser()
    }
    
    
}
