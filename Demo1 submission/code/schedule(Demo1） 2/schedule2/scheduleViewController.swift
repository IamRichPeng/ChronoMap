//
//  scheduleViewController.swift
//  Schedule
//
//  Created by Ruicheng Peng on 10/29/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//

import UIKit
import CoreData

class scheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var missions = [Missions]()
    
    @IBOutlet weak var missionsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest : NSFetchRequest<Missions> = Missions.fetchRequest()
        do{
        let missions = try PersistenceService.context.fetch(fetchRequest)
            self.missions = missions
            self.missionsTableView.reloadData()
        } catch{}
        
        title = "Missions"
        
        missionsTableView.delegate = self
        missionsTableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionCell", for: indexPath)
        let task = missions[indexPath.row]
        
        cell.textLabel?.text = task.name
        return cell
    }
   
    @IBAction func onPlusTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add Mission", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "time"
            textField.keyboardType = .numberPad
        }
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            let time = alert.textFields!.last!.text!
            let mission = Missions(context: PersistenceService.context)
            mission.name = name
            mission.time = Int16(time)!
            PersistenceService.saveContext()
            self.missions.append(mission)
            self.missionsTableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? scheduleDetailsViewController,
            let indexPath = missionsTableView.indexPathForSelectedRow{
            destination.task = missions[indexPath.row]
        }
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
