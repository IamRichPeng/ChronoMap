//
//  scheduleViewController.swift
//  Schedule
//
//  Created by Ruicheng Peng on 10/29/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//

import UIKit
import CoreData

// ******************  this is the background code for "missionlist" page       *************************

class scheduleViewController: UIViewController {
    
    var assignments = [Assignment]()
    
    @IBOutlet weak var missionsTableView: UITableView!
    
    // functions called before the screen load.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Mission List"
        
        
    }
    
    //  functions that fetch data from coredata to an array
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Assignment> = Assignment.fetchRequest()
        
        do{
            assignments = try managedContext.fetch(fetchRequest)
            
            missionsTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
        
    }
    
    // action function that navigate to "addAssignment" page
    @IBAction func addNewAssignment(_ sender: Any) {
        performSegue(withIdentifier: "addAssignment", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // function that provide delete function in coredata
    func deleteAssignment (at indexPath: IndexPath){
        let assignment = assignments[indexPath.row]
        if let managedContext = assignment.managedObjectContext{
            managedContext.delete(assignment)
            do{
                try managedContext.save()
                
                self.assignments.remove(at: (indexPath.row))
                
                missionsTableView.deleteRows(at: [indexPath], with: .automatic)
            }catch{
                print ("Delete failed")
            }
            
        }
    }
    
    // function that navigate each cell(Assignment) to its "scheduleDetails" page and let the variable task in "scheduleDetail" page equal to the selected Assignment
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? scheduleDetailsViewController,
            let indexPath = missionsTableView.indexPathForSelectedRow{
            destination.task = assignments[indexPath.row]
        }
    }
}


//******************       extension of UITableViewDataSource including functions related to tableview's data   *********
extension scheduleViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // numberofRowsInSection is equal the the number of "Assignment" in the assignments array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    //  assign specify value to each cell(Assignment)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = missionsTableView.dequeueReusableCell(withIdentifier: "assignmentCell", for: indexPath)
        let assignment = assignments[indexPath.row]
        
        // get the transition data from "Confirm" in acheduleDetailsViewController
        let fenzhong = UserDefaults().double(forKey: "shijian")
        let mingzi = UserDefaults().string(forKey: "mingzi")
        
        // change the background color of each cell according to whether its done and its priority
        if assignment.name == mingzi && assignment.time == fenzhong{
            cell.backgroundColor = UIColor.gray
        }
        else{
            if (assignment.priority == "High"){
                cell.backgroundColor = UIColor.red
            }
            if (assignment.priority == "Medium"){
                cell.backgroundColor = UIColor.yellow
            }
            if (assignment.priority == "Low"){
                cell.backgroundColor = UIColor.green
            }
        }
        
        cell.textLabel?.text = assignment.name
        cell.detailTextLabel?.text = String(assignment.time) + "min"
        
        return cell
    }
    
    
    // function that allow user "swipe and delete" a cell in tableview.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteAssignment(at: indexPath)
        }
    }
}

//extension scheduleViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showDetail", sender: self)
//    }
//}
//

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

