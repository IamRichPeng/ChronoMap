//
//  Entity+CoreDataClass.swift
//  schedule2
//
//  Created by 崔皓凡 on 12/5/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Entity)
public class Entity: NSManagedObject {
    convenience init?(property: Double?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext
            else {
                return nil
        }
        self.init(entity: Entity.entity(), insertInto: managedContext)
        self.property = property!
    }
    convenience init?(reward: Double?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let manegedContext1 = appDelegate?.persistentContainer.viewContext
            else {
                return nil
        }
        self.init(entity: Entity.entity(), insertInto: manegedContext1)
        self.reward = reward!
    }
    
}
