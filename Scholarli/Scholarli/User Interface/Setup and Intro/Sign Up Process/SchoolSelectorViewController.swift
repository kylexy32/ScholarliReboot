//
//  SchoolSelectorViewController.swift
//  Scholarli
//
//  Created by Kyle Papili on 6/18/18.
//  Copyright © 2018 Scholarli. All rights reserved.
//

import UIKit

class SchoolSelectorViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    var listOfSchools : [School] = []
    var currentSelection : School? = nil
    var pageVC : SignUpPageViewController?
    
    @IBOutlet var SchoolPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let testSchool = School.init(displayName: "test", id: "test", type: .Public, streetAddress: "63 Mel Dr", city: "chester", zipCode: 07930, state: "NJ", MaxStudentCourseLoad: 9)
        testSchool.getSchools { (listOfSchools) in
            self.listOfSchools = listOfSchools
            self.SchoolPicker.reloadAllComponents()
        }
    }
    
    func updateNewUser() {
        self.pageVC?.newUser!["school"] = currentSelection
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfSchools.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfSchools[row].displayName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentSelection = listOfSchools[row]
        
    }
    

}