//
//  TransactionReceipt+CoreDataClass.swift
//  Store
//
//  Created by Kyle Kendall on 2/3/19.
//  Copyright © 2019 CarSwaddle. All rights reserved.
//
//

import Foundation
import CoreData

typealias TransactionReceiptValues = (identifier: String, receiptPhotoID: String)

@objc(TransactionReceipt)
final public class TransactionReceipt: NSManagedObject, NSManagedObjectFetchable, JSONInitable {
    
    public static func receipts(from jsonArray: [JSONObject], in context: NSManagedObjectContext) -> [TransactionReceipt] {
        var receipts: [TransactionReceipt] = []
        for json in jsonArray {
            guard let receipt = TransactionReceipt(json: json, context: context) else { continue }
            receipts.append(receipt)
        }
        return receipts
    }
    
    public convenience init?(json: JSONObject, context: NSManagedObjectContext) {
        guard let values = TransactionReceipt.values(from: json) else { return nil }
        self.init(context: context)
        configure(with: values, json: json, in: context)
    }
    
    public func configure(with json: JSONObject) throws {
        guard let values = TransactionReceipt.values(from: json) else { throw StoreError.invalidJSON }
        guard let context = managedObjectContext else { return }
        self.configure(with: values, json: json, in: context)
    }
    
    static private func values(from json: JSONObject) -> TransactionReceiptValues? {
        guard let identifier = json["id"] as? String,
            let receiptPhotoID = json["receiptPhotoID"] as? String else { return nil }
        return (identifier, receiptPhotoID)
    }
    
    private func configure(with values: TransactionReceiptValues, json: JSONObject, in context: NSManagedObjectContext) {
        self.identifier = values.identifier
        self.receiptPhotoID = values.receiptPhotoID
    }
    
}
