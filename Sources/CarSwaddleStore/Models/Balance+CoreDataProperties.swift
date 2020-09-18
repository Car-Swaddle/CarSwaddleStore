//
//  Balance+CoreDataProperties.swift
//  Store
//
//  Created by Kyle Kendall on 1/12/19.
//  Copyright © 2019 CarSwaddle. All rights reserved.
//
//

import Foundation
import CoreData


public extension Balance {

    @nonobjc class func fetchRequest() -> NSFetchRequest<Balance> {
        return NSFetchRequest<Balance>(entityName: Balance.entityName)
    }

    @NSManaged var available: Amount
    @NSManaged var pending: Amount
    @NSManaged var reserved: Amount?
    @NSManaged var mechanic: Mechanic?

}
