//
//  StubListNewsGateway.swift
//  RedditorTests
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation
import PromiseKit
@testable import Redditor

class StubListNewsGateway: ListNewsGateway {
    var expectation: [News] = []
    func listNews() -> Promise<[News]> {
        return Promise { seal in
            seal.fulfill(expectation)
        }
    }
}
