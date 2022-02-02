//
//  AccountServiceTests.swift
//  libtad iOS
//
//  Created by Zoltan Tuskes on 02/02/2022.
//  Copyright © 2022 Time and Date. All rights reserved.
//

import Foundation


import XCTest
@testable import libtad

class AccountServiceTests: XCTestCase {

     let request = AccountRequest()

     override func setUp() {
           super.setUp()
           // Put setup code here. This method is called before the invocation of each test method in the class.

       }

       override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
           super.tearDown()
       }

    func test_AccessKeyNotSet_ErrorTrue() {
        // given
        let expectation = self.expectation(description: "Request Completed")
        let accessKey: String? = nil
        let secretKey = "secret"
        let aService = AccountService(accessKey: accessKey, secretKey: secretKey)

        // when
        aService.getAccount(request: request, completionHandler: {
            (_, error) in

            XCTAssertTrue((error != nil), error.debugDescription)
            expectation.fulfill()
        })

        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }

    }

    func test_SecretKeyNotSet_ErrorTrue() {
           // given
           let expectation = self.expectation(description: "Request Completed")
           let accessKey = "access"
           let secretKey: String? = nil
           let aService = AccountService(accessKey: accessKey, secretKey: secretKey)

           // when
           aService.getAccount(request: request, completionHandler: {
               (_, error) in

               XCTAssertTrue((error != nil), error.debugDescription)
               expectation.fulfill()
           })

           waitForExpectations(timeout: 5) { (error) in
               if let error = error {
                   XCTFail("waitForExpectationsWithTimeout errored: \(error)")
               }
           }
     }
    
    /// If you like to test in production, use your accessKey and secretKey
    func test_Account_AllOk() {
          // given
           let expectation = self.expectation(description: "Request Completed")
           let accessKey: String? = "access"
           let secretKey: String? = "secret"
           let aService = AccountService(accessKey: accessKey, secretKey: secretKey)

           // when
           aService.getAccount(request: request, completionHandler: {
               (_, error) in

               XCTAssertTrue((error != nil), error.debugDescription)
               expectation.fulfill()
           })

           waitForExpectations(timeout: 5) { (error) in
               if let error = error {
                   XCTFail("waitForExpectationsWithTimeout errored: \(error)")
               }
           }
     }

}

