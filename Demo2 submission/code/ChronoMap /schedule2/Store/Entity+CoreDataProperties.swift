//
//  Entity+CoreDataProperties.swift
//  schedule2
//
//  Created by 崔皓凡 on 12/5/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var property: Double
    @NSManaged public var reward: Double

}
