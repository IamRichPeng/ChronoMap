//
//  Missions+CoreDataProperties.swift
//  schedule2
//
//  Created by Ruicheng Peng on 10/31/18.
//  Copyright © 2018 Ruicheng Peng. All rights reserved.
//
//

import Foundation
import CoreData


extension Missions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Missions> {
        return NSFetchRequest<Missions>(entityName: "Missions")
    }

    @NSManaged public var name: String?
    @NSManaged public var time: Int16

}
