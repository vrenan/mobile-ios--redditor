//
//  StubListView.swift
//  RedditorTests
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation
@testable import Redditor

class StubListNewsView: ListNewsView {
    
    var isStartLoadingCalled = false
    var isStopLoadingCalled = false
    var isStopRefreshingCalled = false
    var isReloadDataCalled = false
    
    func startLoading() {
        isStartLoadingCalled = true
    }
    
    func stopLoading() {
        isStopLoadingCalled = true
    }
    
    func reloadData() {
        isReloadDataCalled = true
    }
    
    func stopRefreshing() {
        isStopRefreshingCalled = true
    }
}
