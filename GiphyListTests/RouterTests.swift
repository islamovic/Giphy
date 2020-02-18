//
//  RouterTests.swift
//  GiphyListTests
//
//  Created by Islam on 2/18/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import XCTest
@testable import Giphy

class RouterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRouter() {
        let emptyPath = EndPoint(path: nil, method: .get)
        var downloadedData: Data?
        let emptyPathExpectation = self.expectation(description: "Empty Path")

        Router.shared.request(emptyPath, success: { (data, response) in

            downloadedData = data
        }) { (error) in

            emptyPathExpectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(downloadedData, nil)
    }

    func testEmptyBaseURL() {

        Router.shared.baseURL = nil
        let emptyPath = EndPoint(path: "trending?api_key=1L9rTdIySwunODKuMPXO26SyDkyjm6Cj&limit=20&offset=25&rating=pg", method: .get)
        var downloadedData: Data?
        let emptyPathExpectation = self.expectation(description: "Empty Path")

        Router.shared.request(emptyPath, success: { (data, response) in

            downloadedData = data
        }) { (error) in

            emptyPathExpectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(downloadedData, nil)
    }
}
