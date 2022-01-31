//
//  HolidaysServiceTests.swift
//  TadApiTests
//
//  Created by Zoltan Tuskes on 08/06/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import XCTest
@testable import libtad

class HolidaysServiceTests: XCTestCase {

     let request = HolidaysRequest()

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
        let aService = HolidaysService(accessKey: accessKey, secretKey: secretKey)

        // when
        aService.getHolidays(request: request, completionHandler: {
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
           let aService = HolidaysService(accessKey: accessKey, secretKey: secretKey)

           // when
           aService.getHolidays(request: request, completionHandler: {
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

    func test_CountryNotSet_ErrorTrue() {
          // given
           let expectation = self.expectation(description: "Request Completed")
           let accessKey: String? = "access"
           let secretKey: String? = "secret"
           let aService = HolidaysService(accessKey: accessKey, secretKey: secretKey)

           // when
           aService.getHolidays(request: request, completionHandler: {
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

    func test_YearNotSet_ErrorTrue() {
         // given
          let expectation = self.expectation(description: "Request Completed")
          let accessKey: String? = "access"
          let secretKey: String? = "secret"
          let aService = HolidaysService(accessKey: accessKey, secretKey: secretKey)
          request.country = "no"

          // when
          aService.getHolidays(request: request, completionHandler: {
              (_, error) in

            XCTAssertTrue((error != nil), error.debugDescription)
            print(error.debugDescription)
            expectation.fulfill()
          })

          waitForExpectations(timeout: 5) { (error) in
              if let error = error {
                  XCTFail("waitForExpectationsWithTimeout errored: \(error)")
              }
          }
    }

}
