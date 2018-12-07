//
//  scheduleDetailsViewController.swift
//  Schedule
//
//  Created by Ruicheng Peng on 10/30/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//

import UIKit
import CoreData

// ***********************    Background code for "scheduleDetail" ( "Confirm") page    ***************************
class scheduleDetailsViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    // task is the Assignment which is selected in tableview
    var task: Assignment?
    
    var assignments = [Assignment]()
    
    // function called before screen load, which initialize the value of label.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = task {
            nameLabel.text = task.name
            timeLabel.text = "\(task.time)"
            priorityLabel.text = task.priority
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // Dispose of any resources that can be recreated
    
    // function used to fetch data
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Assignment> = Assignment.fetchRequest()
        
        do{
            assignments = try managedContext.fetch(fetchRequest)
            
        } catch {
            print("Fetch could not be performed")
        }
        
    }
    
    
    // return to its previous page
    @IBAction func cancel(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    // this function is used to navigate to count-down page and transit the "time" of the assiment to "count-down" and "store" sections.
    @IBAction func confirm(_ sender: Any) {
        //        func prepare(for segue: UIStoryboardSegue,send: Any?){
        //            if let destination = segue.destination as? countdownViewController{
        //                destination.selectedSecs = Int((task?.time ?? 0)*60)
        //
        //        }
        //    }
        UserDefaults().setValue(task?.name, forKey: "mingzi")
        UserDefaults().setValue(task?.time, forKey: "shijian")
    }
}

