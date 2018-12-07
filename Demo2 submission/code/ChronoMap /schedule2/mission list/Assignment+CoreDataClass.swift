//
//  Assignment+CoreDataClass.swift
//  schedule2
//
//  Created by Ruicheng Peng on 12/2/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Assignment)
public class Assignment: NSManagedObject {
    convenience init?(name: String?, time: Double, priority: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard  let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Assignment.entity(), insertInto: managedContext)
        
        self.name = name
        self.time = time
        self.priority = priority
    }
}
