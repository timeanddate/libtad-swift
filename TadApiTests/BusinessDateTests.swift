//
//  BusinessDateTests.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 17/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import XCTest
@testable import TadApi

class BusinessDateTests: XCTestCase {

     let request = BusinessDateRequest()

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
        let aService = BusinessDateService(accessKey: accessKey, secretKey: secretKey)

        // when
        aService.calculateBusinessDate(request: request, completionHandler: {
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
           let accessKey: String? = "access"
           let secretKey: String? = nil
           let aService = BusinessDateService(accessKey: accessKey, secretKey: secretKey)

           // when
           aService.calculateBusinessDate(request: request, completionHandler: {
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

    func test_PlaceIdNotSet_ErrorTrue() {
          // given
           let expectation = self.expectation(description: "Request Completed")
           let accessKey: String? = "access"
           let secretKey: String? = "secret"
           let aService = BusinessDateService(accessKey: accessKey, secretKey: secretKey)

           // when
           aService.calculateBusinessDate(request: request, completionHandler: {
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
