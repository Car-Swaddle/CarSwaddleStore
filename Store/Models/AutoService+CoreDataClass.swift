//
//  Service+CoreDataClass.swift
//  
//
//  Created by Kyle Kendall on 9/16/18.
//
//

import Foundation
import CoreData


public extension AutoService {
    
    public enum Status: String {
        case created
        case requested
        case canceled
        case inProgress
        case completed
    }
    
}

private let statusKey = "status"
private let typeKey = "type"

@objc(AutoService)
public final class AutoService: NSManagedObject, NSManagedObjectFetchable, JSONInitable {
    
    public convenience init?(json: JSONObject, context: NSManagedObjectContext) {
        return nil
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        primitiveCreationDate = Date()
        primitiveIdentifier = AutoService.tempID
        primitiveStatus = Status.created.rawValue
    }
    
    @NSManaged private var primitiveIdentifier: String
    @NSManaged private var primitiveCreationDate: Date
    @NSManaged private var primitiveStatus: String
    
    public var status: Status {
        set {
            willChangeValue(forKey: statusKey)
            primitiveStatus = newValue.rawValue
            didChangeValue(forKey: statusKey)
        }
        get {
            willAccessValue(forKey: statusKey)
            let enumValue = Status(rawValue: primitiveStatus) ?? .created
            didAccessValue(forKey: statusKey)
            return enumValue
        }
    }
    
}

extension AutoService {
    
    public static func fetchMostRecentlyUsed(forUserID userID: String, in context: NSManagedObjectContext) -> AutoService? {
        let fetchRequest: NSFetchRequest<AutoService> = AutoService.fetchRequest(forUserID: userID)
        fetchRequest.sortDescriptors = [recentlyUsedSort]
        fetchRequest.fetchLimit = 1
        return ((try? context.fetch(fetchRequest)) ?? []).first
    }
    
    public static func fetchRequest(forUserID userID: String) -> NSFetchRequest<AutoService> {
        let fetchRequest: NSFetchRequest<AutoService> = AutoService.fetchRequest()
        fetchRequest.predicate = AutoService.predicate(forUserID: userID)
        return fetchRequest
    }
    
    public static func predicate(forUserID userID: String) -> NSPredicate {
        return NSPredicate(format: "%K == %@", #keyPath(AutoService.creator.identifier), userID)
    }
    
    public static var recentlyUsedSort: NSSortDescriptor {
        return NSSortDescriptor(key: #keyPath(AutoService.creationDate), ascending: true)
    }
    
}
