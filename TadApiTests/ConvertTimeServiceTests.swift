//
//  ConvertTimeServiceTests.swift
//  TadApiTests
//
//  Created by Zoltan Tuskes on 13/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import XCTest
@testable import TadApi

class ConvertTimeServiceTests: XCTestCase {

     let request = ConvertTimeRequest()

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
        let accessKey: String! = nil
        let secretKey = "secret"
        let aService = ConvertTimeService(accessKey: accessKey, secretKey: secretKey)

        // when
        aService.convertTime(request: request, completionHandler: {
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
          let aService = ConvertTimeService(accessKey: accessKey, secretKey: secretKey)

           // when
           aService.convertTime(request: request, completionHandler: {
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

    func test_fromPlaceIdNotSet_ErrorTrue() {
          // given
           let expectation = self.expectation(description: "Request Completed")
           let accessKey: String? = "access"
           let secretKey: String? = "secret"
           let aService = ConvertTimeService(accessKey: accessKey, secretKey: secretKey)

           // when
           aService.convertTime(request: request, completionHandler: {
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
