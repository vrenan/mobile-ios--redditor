//
//  BaseTests.swift
//  RedditorTests
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import XCTest
import PromiseKit

class PromiseBasedTests: XCTestCase {

    override func setUp() {
        PromiseKit.conf.Q.map = nil
        PromiseKit.conf.Q.return = nil
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
