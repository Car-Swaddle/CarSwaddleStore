//
//  File.swift
//  
//
//  Created by Kyle Kendall on 7/28/21.
//

import CoreData
import CarSwaddleNetworkRequest

final public class GiftCardNetwork {
    
    private var giftCardService: GiftCardService
    
    public init(serviceRequest: Request) {
        self.giftCardService = GiftCardService(serviceRequest: serviceRequest)
    }
    
    @discardableResult
    public func getGiftCard(code: String, in context: NSManagedObjectContext, completion: @escaping (_ giftCard: GiftCard?, _ error: Error?) -> Void) -> URLSessionDataTask? {
        return giftCardService.getGiftCardByCode(code: code) { networkGiftCard, error in
            importGiftCard(networkGiftCard: networkGiftCard, context: context)
        }
    }
    
    @discardableResult
    public func getGiftCard(identifier: String, in context: NSManagedObjectContext, completion: @escaping (_ giftCard: GiftCard?, _ error: Error?) -> Void) -> URLSessionDataTask? {
        return giftCardService.getGiftCardByID(identifier: identifier) { networkGiftCard, error in
            importGiftCard(networkGiftCard: networkGiftCard, context: context)
        }
    }
    
    @discardableResult
    public func createGiftCard(giftCardCreate: GiftCardCreate, in context: NSManagedObjectContext, completion: @escaping (_ giftCard: GiftCard?, _ error: Error?) -> Void) -> URLSessionDataTask? {
        return giftCardService.createGiftCard(giftCard: giftCardCreate) { networkGiftCard, error in
            importGiftCard(networkGiftCard: networkGiftCard, context: context)
        }
    }
    
    @discardableResult
    public func deleteGiftCard(identifier: String, in context: NSManagedObjectContext, completion: @escaping (_ error: Error?) -> Void) -> URLSessionDataTask? {
        return giftCardService.deleteGiftCardByID(identifier: identifier) { error in
            completion(error)
        }
    }
    
    private func importGiftCard(networkGiftCard: GiftCard?, context: NSManagedObjectContext) {
        context.performOnImportQueue {
            if let networkGiftCard = networkGiftCard {
                let giftCard = GiftCard.fetchOrCreate(giftCard: networkGiftCard, in: context)
                context.persist()
                completion(giftCard, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
}
