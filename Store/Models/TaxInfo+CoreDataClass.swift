//
//  TaxInfo+CoreDataClass.swift
//  Store
//
//  Created by Kyle Kendall on 2/10/19.
//  Copyright © 2019 CarSwaddle. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TaxInfo)
public class TaxInfo: NSManagedObject {
    
    public convenience init?(year: String, context: NSManagedObjectContext) {
        self.init(context: context)
        self.year = year
    }
    
    public convenience init?(json: JSONObject, context: NSManagedObjectContext) {
        guard let metersDriven = json["metersDriven"] as? String,
            let mechanicCostInCents = json["mechanicCostInCents"] as? String,
            let taxYear = json["taxYear"] as? String else { return nil }
        
        self.init(context: context)
        
        self.year = taxYear
        self.metersDriven = metersDriven
        self.mechanicCostInCents = mechanicCostInCents
    }
    
}
