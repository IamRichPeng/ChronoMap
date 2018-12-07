//
//  Assignment+CoreDataProperties.swift
//  schedule2
//
//  Created by Ruicheng Peng on 12/2/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//
//

import Foundation
import CoreData


extension Assignment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assignment> {
        return NSFetchRequest<Assignment>(entityName: "Assignment")
    }

    @NSManaged public var name: String?
    @NSManaged public var time: Double
    @NSManaged public var priority: String?

}
