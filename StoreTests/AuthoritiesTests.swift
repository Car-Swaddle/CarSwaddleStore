//
//  AuthoritiesTests.swift
//  StoreTests
//
//  Created by Kyle Kendall on 6/13/19.
//  Copyright © 2019 CarSwaddle. All rights reserved.
//

import XCTest
@testable import Store

class AuthoritiesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        try? store.destroyAllData()
        store.mainContext.persist()
    }
    
    func testCreateAuthority() {
        let authority = Authority.fetchOrCreate(json: authorityJSON, context: store.mainContext)
        XCTAssert(authority != nil, "Should have authority")
        XCTAssert(authority?.authorityConfirmation != nil, "Should have confirmation")
        XCTAssert(authority?.authorityConfirmation?.confirmer != nil, "Should have confirmation")
        XCTAssert(authority?.user != nil, "Should have confirmation")
        
        let result = store.mainContext.persist()
        
        XCTAssert(result, "Should be true")
    }
    
    func testCreateAuthorityRequest() {
        let authorityRequest = AuthorityRequest.fetchOrCreate(json: authorityRequestJSON, context: store.mainContext)
        XCTAssert(authorityRequest != nil, "Should have authority")
        XCTAssert(authorityRequest?.requester != nil, "Should have confirmation")
        
        let result = store.mainContext.persist()
        
        XCTAssert(result, "Should be true")
    }
    
}

private let authorityJSON: [String: Any] = [
    "id": "5c37d130-8e5f-11e9-8136-ffee546f26bb",
    "authorityName": "editAuthorities",
    "createdAt": "2019-06-14T04:46:23.176Z",
    "updatedAt": "2019-06-14T04:46:23.176Z",
    "userID": "19a48340-8e5f-11e9-8136-ffee546f26bb",
    "authorityConfirmation": [
        "id": "5c364a90-8e5f-11e9-8136-ffee546f26bb",
        "status": "approved",
        "createdAt": "2019-06-14T04:46:23.161Z",
        "updatedAt": "2019-06-14T04:46:23.189Z",
        "authorityID": "5c37d130-8e5f-11e9-8136-ffee546f26bb",
        "confirmerID": "19a48340-8e5f-11e9-8136-ffee546f26bb",
        "authorityRequestID": "27d09850-8e5f-11e9-8136-ffee546f26bb",
        "user": [
            "firstName": NSNull(),
            "lastName": NSNull(),
            "id": "19a48340-8e5f-11e9-8136-ffee546f26bb",
            "profileImageID": NSNull(),
            "email": "kyle@carswaddle.com",
            "phoneNumber": NSNull(),
            "timeZone": "America/Denver"
        ]
    ],
    "user": [
        "firstName": NSNull(),
        "lastName": NSNull(),
        "id": "19a48340-8e5f-11e9-8136-ffee546f26bb",
        "profileImageID": NSNull(),
        "email": "kyle@carswaddle.com",
        "phoneNumber": NSNull(),
        "timeZone": "America/Denver"
    ]
]

private let authorityRequestJSON: [String: Any] = [
    "id": "27d09850-8e5f-11e9-8136-ffee546f26bb",
    "authorityName": "editAuthorities",
    "expirationDate": "2019-06-15T04:44:55.253Z",
    "createdAt": "2019-06-14T04:44:55.254Z",
    "updatedAt": "2019-06-14T04:44:55.254Z",
    "authorityID": NSNull(),
    "requesterID": "19a48340-8e5f-11e9-8136-ffee546f26bb",
    "user": [
        "firstName": NSNull(),
        "lastName": NSNull(),
        "id": "19a48340-8e5f-11e9-8136-ffee546f26bb",
        "profileImageID": NSNull(),
        "email": "kyle@carswaddle.com",
        "phoneNumber": NSNull(),
        "timeZone": "America/Denver"
        ] as [String: Any],
    "authorityConfirmation": [
        "id": "5c364a90-8e5f-11e9-8136-ffee546f26bb",
        "status": "approved",
        "createdAt": "2019-06-14T04:46:23.161Z",
        "updatedAt": "2019-06-14T04:46:23.189Z",
        "authorityID": "5c37d130-8e5f-11e9-8136-ffee546f26bb",
        "confirmerID": "19a48340-8e5f-11e9-8136-ffee546f26bb",
        "authorityRequestID": "27d09850-8e5f-11e9-8136-ffee546f26bb"
    ]
]
