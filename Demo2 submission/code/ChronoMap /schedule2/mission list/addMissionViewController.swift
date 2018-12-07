//
//  addMissionViewController.swift
//  schedule2
//
//  Created by Ruicheng Peng on 10/31/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//

import UIKit

// *****************       Background code for addMission page    *********************
class addMissionViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var priorityPicker: UIPickerView!
    
    private let dataSource = ["High","Medium","Low"]
    
    var priorityTemp: String = "Medium"
    
    // function called before screen load, which initialize the pickerview and set it to the second row in default.
    override func viewDidLoad() {
        super.viewDidLoad()
        priorityPicker.dataSource = self
        priorityPicker.delegate = self
        priorityPicker.selectRow(1, inComponent: 0, animated: true)
        timeTextField.keyboardType = UIKeyboardType.numberPad
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        nameTextField.delegate = self
        timeTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        timeTextField.resignFirstResponder()
        
    }
    
    
    // action function for "Save" button, which save the data in textfield and pickerview to core data
    @IBAction func saveAssignment(_ sender: Any) {
        let name = nameTextField.text
        let timeText = timeTextField.text ?? ""
        let time = Double(timeText) ?? 0.0
        let priority = priorityTemp
        
        // saving to core data.
        if let assignment = Assignment(name: name, time: time, priority: priority){
            do{
                let managedContext = assignment.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch{
                print("Assignment could not be saved")
            }
        }
        
        
    }
    
}

extension addMissionViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


// pickerview's attributes are declared here
extension addMissionViewController: UIPickerViewDataSource,UIPickerViewDelegate{
    // has only one column
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // has 3 rows
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    //selection maken.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        priorityTemp = dataSource[row]
    }
    //return selected string
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}

