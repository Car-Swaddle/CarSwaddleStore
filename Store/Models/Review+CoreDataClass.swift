//
//  Review+CoreDataClass.swift
//  Store
//
//  Created by Kyle Kendall on 1/1/19.
//  Copyright © 2019 CarSwaddle. All rights reserved.
//
//

import Foundation
import CoreData


typealias ReviewValues = (identifier: String, rating: CGFloat, text: String?, reviewerID: String, revieweeID: String, mechanicID: String?, userID: String?, autoServiceIDFromUser: String?, autoServiceIDFromMechanic: String?)

@objc(Review)
final public class Review: NSManagedObject, NSManagedObjectFetchable, JSONInitable {
    
    public convenience init?(json: JSONObject, context: NSManagedObjectContext) {
        guard let values = Review.values(from: json) else { return nil }
        self.init(context: context)
        configure(with: values, in: context)
    }
    
    public func configure(with json: JSONObject) throws {
        guard let values = Review.values(from: json) else { throw StoreError.invalidJSON }
        guard let context = managedObjectContext else { return }
        self.configure(with: values, in: context)
    }
    
    static private func values(from json: JSONObject) -> ReviewValues? {
        guard let identifier = json["id"] as? String,
            let reviewerID = json["reviewerID"] as? String,
            let revieweeID = json["revieweeID"] as? String,
            let rating = json["rating"] as? CGFloat else { return nil }
        
        let text = json["text"] as? String
        
        let mechanicID = json["mechanicID"] as? String
        let userID = json["userID"] as? String
        let autoServiceIDFromMechanic = json["autoServiceIDFromMechanic"] as? String
        let autoServiceIDFromUser = json["autoServiceIDFromUser"] as? String
        
        return (identifier, rating, text, reviewerID, revieweeID, mechanicID, userID, autoServiceIDFromMechanic, autoServiceIDFromUser)
    }
    
    private func configure(with values: ReviewValues, in context: NSManagedObjectContext) {
        self.identifier = values.identifier
        self.rating = values.rating
        self.text = values.text
        self.reviewerID = values.reviewerID
        self.revieweeID = values.revieweeID
        
        if let mechanicID = values.mechanicID {
            self.mechanic = Mechanic.fetch(with: mechanicID, in: context)
        }
        if let userID = values.userID {
            self.user = User.fetch(with: userID, in: context)
        }
        if let autoServiceIDFromMechanic = values.autoServiceIDFromMechanic {
            self.autoServiceFromMechanic = AutoService.fetch(with: autoServiceIDFromMechanic, in: context)
        }
        if let autoServiceIDFromUser = values.autoServiceIDFromUser {
            self.autoServiceFromUser = AutoService.fetch(with: autoServiceIDFromUser, in: context)
        }
    }
    
}
