//
//  Payout+CoreDataProperties.swift
//  Store
//
//  Created by Kyle Kendall on 1/13/19.
//  Copyright © 2019 CarSwaddle. All rights reserved.
//
//

import Foundation
import CoreData


extension Payout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Payout> {
        return NSFetchRequest<Payout>(entityName: Payout.entityName)
    }

    @NSManaged public var identifier: String
    @NSManaged public var amount: Int
    @NSManaged public var arrivalDate: Date
    @NSManaged public var created: Date
    @NSManaged public var currency: String
    @NSManaged public var payoutDescription: String?
    @NSManaged public var destination: String?
    @NSManaged public var type: String
    @NSManaged public var status: String
    @NSManaged public var method: String
    @NSManaged public var sourceType: String
    @NSManaged public var statementDescriptor: String?
    @NSManaged public var failureMessage: String?
    @NSManaged public var failureCode: String?
    @NSManaged public var failureBalanceTransaction: String?
    @NSManaged public var transactions: Set<Transaction>

}
