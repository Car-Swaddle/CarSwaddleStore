//
//  File.swift
//  
//
//  Created by Kyle Kendall on 5/14/21.
//

import CoreData

@objc(Referrer)
public final class Referrer: NSManagedObject, NSManagedObjectFetchable, Identifiable {
    public var id: String {
        identifier
    }
    
    
    @NSManaged public var identifier: String
    // Pseudo-enum for source: user, email, ad, campaign, etc
    @NSManaged public var sourceType: String
    // Internal metadata - id for ad campaign, email template
    @NSManaged public var externalID: String
    @NSManaged public var createdAt: Date
    @NSManaged public var updatedAt: Date
    @NSManaged public var referrerDescription: String?
    @NSManaged public var stripeExpressAccountID: String
    @NSManaged public var vanityID: String
    @NSManaged public var activeCouponID: String?
    @NSManaged public var activePayStructureID: String?
    @NSManaged public var userID: String
    @NSManaged public var couponID: String?
    @NSManaged public var payStructureID: String?
    
}
