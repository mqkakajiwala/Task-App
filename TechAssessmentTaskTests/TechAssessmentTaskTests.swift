//
//  TechAssessmentTaskTests.swift
//  TechAssessmentTaskTests
//
//  Created by Mustafa on 28/02/2019.
//  Copyright © 2019 Mustafa. All rights reserved.
//

import XCTest
@testable import TechAssessmentTask

class TechAssessmentTaskTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkAPI() {
        let promise = expectation(description: "Completion handler invoked")
        
        let url = APIEndpoints.baseURL + APIEndpoints.mostPopularArticlesApi + APIKey.ApiKey
        Request.requestMostPopularArticleData(url: url) {
            success, response, error in
            if success {
                promise.fulfill()
            } else {
                XCTAssertNil(error)
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
