//
//  File.swift
//  
//
//  Created by Kyle Kendall on 7/27/21.
//

import CoreData
import CarSwaddleNetworkRequest


public final class GiftCard: NSManagedObject, NSManagedObjectFetchable {
    
    public convenience init(giftCard: CarSwaddleNetworkRequest.GiftCard, context: NSManagedObjectContext) {
        self.init(context: context)
        configure(giftCard: giftCard)
    }
    
    func configure(giftCard: CarSwaddleNetworkRequest.GiftCard) {
        self.identifier = giftCard.id
        self.code = giftCard.code
        self.expiration = giftCard.expiration
        self.batchGroup = giftCard.batchGroup
        self.purchaser = giftCard.purchaser
        self.remainingBalance = giftCard.remainingBalance
        self.startingBalance = giftCard.startingBalance
    }
    
    static func fetchOrCreate(giftCard requestGiftCard: CarSwaddleNetworkRequest.GiftCard, in context: NSManagedObjectContext) -> GiftCard {
        var giftCard: GiftCard
        if let fetched = GiftCard.fetch(with: requestGiftCard.id, in: context) {
            giftCard = fetched
        } else {
            giftCard = GiftCard(giftCard: requestGiftCard, context: context)
        }
        giftCard.configure(giftCard: requestGiftCard)
        return giftCard
    }
    
}
