//
//  scheduleDetailsViewController.swift
//  Schedule
//
//  Created by Ruicheng Peng on 10/30/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//

import UIKit

class scheduleDetailsViewController: UIViewController {

   
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    var task: Missions?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        if let task = task {
            nameLabel.text = task.name
            timeLabel.text = "\(task.time)"
        }
 self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // Dispose of any resources that can be recreated
    

    @IBAction func cancel(_ sender: Any) {

        navigationController?.popToRootViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
