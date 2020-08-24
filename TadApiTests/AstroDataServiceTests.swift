//
//  AstroServiceTests.swift
//  TadApiTests
//
//  Created by Zoltan Tuskes on 30/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import XCTest
@testable import TadApi

class AstroDataServiceTests: XCTestCase {

    let request = AstrodataRequest()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_AccessKeyNotSet_ErrorTrue() {
        // given
        let expectation = self.expectation(description: "Request Completed")
        let accessKey: String? = nil
        let secretKey = "secret"
        let aService = AstrodataService(accessKey: accessKey, secretKey: secretKey)

        // when
        aService.getAstroDataInfo(request: request, completionHandler: {
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
        let aService = AstrodataService(accessKey: accessKey, secretKey: secretKey)

        // when
        aService.getAstroDataInfo(request: request, completionHandler: {
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

    func test_ObjectNotSet_ErrorTrue() {
        // given
        let expectation = self.expectation(description: "Request Completed")
        let accessKey = "access"
        let secretKey = "secret"
        let aService = AstrodataService(accessKey: accessKey, secretKey: secretKey)
        request.placeId = "100"
        request.interval = ["timestampgoeshere"]

        // when
        aService.getAstroDataInfo(request: request, completionHandler: {
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
        let accessKey = "access"
        let secretKey = "secret"
        let aService = AstrodataService(accessKey: accessKey, secretKey: secretKey)
        request.objects = [AstroObjectType.sun]
        request.interval = ["timestampgoeshere"]

        // when
        aService.getAstroDataInfo(request: request, completionHandler: {
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

    func test_moreThan50_ErrorTrue() {
        //given
        let expectation = self.expectation(description: "")
        let accesskey = "accesskey"
        let secretkey = "secrets"
        let service = AstrodataService(accessKey: accesskey, secretKey: secretkey)
        request.objects = [.sun]
        request.placeId = "100"
        request.interval = Array( repeatElement("timestampGoesHere", count: 51) )

        //when
        service.getAstroDataInfo(request: request) { (_, error) in
            XCTAssertTrue((error != nil), error.debugDescription)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }

    }
}
