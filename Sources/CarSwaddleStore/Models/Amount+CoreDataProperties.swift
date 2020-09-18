//
//  Amount+CoreDataProperties.swift
//  Store
//
//  Created by Kyle Kendall on 1/12/19.
//  Copyright © 2019 CarSwaddle. All rights reserved.
//
//

import Foundation
import CoreData


public extension Amount {

    @nonobjc class func fetchRequest() -> NSFetchRequest<Amount> {
        return NSFetchRequest<Amount>(entityName: Amount.entityName)
    }

    @NSManaged var value: Int
    @NSManaged var currency: String
    @NSManaged var balanceForAvailable: Balance?
    @NSManaged var balanceForPending: Balance?
    @NSManaged var balanceForReserved: Balance?

}
