//
//  File.swift
//  
//
//  Created by Kyle Kendall on 7/27/21.
//

import CoreData
import CarSwaddleNetworkRequest

extension GiftCard {

    @nonobjc public static func fetchRequest() -> NSFetchRequest<GiftCard> {
        return NSFetchRequest<GiftCard>(entityName: GiftCard.entityName)
    }

    @NSManaged public var identifier: String
    @NSManaged public var code: String
    @NSManaged public var expiration: Date?
    @NSManaged public var batchGroup: String?
    @NSManaged public var purchaser: String?
    @NSManaged public var remainingBalance: Int
    @NSManaged public var startingBalance: Int
    
}
