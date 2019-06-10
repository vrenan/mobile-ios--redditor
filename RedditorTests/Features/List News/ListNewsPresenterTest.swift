//
//  ListNewsPresenterTest.swift
//  RedditorTests
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import XCTest
@testable import Redditor

class ListNewsPresenterTest: PromiseBasedTests {

    private var sut: ListNewsPresenter!
    private var stubView: StubListNewsView!
    
    override func setUp() {
        super.setUp()
        let stubGateway = StubListNewsGateway()
        sut = ListNewsPresenter(gateway: stubGateway)
        stubView = StubListNewsView()
    }
    
    func test_listNewsPresenter_showsLoading() {
        whenViewDidLoad()
        XCTAssertTrue(stubView.isStartLoadingCalled)
    }
    
    func test_listNewsPresenter_stopsLoading() {
        whenViewDidLoad()
        XCTAssertTrue(stubView.isStopLoadingCalled)
    }
    
    func test_listNewsPresenter_when_viewDidLoaded_relodsData() {
        whenViewDidLoad()
        XCTAssertTrue(stubView.isReloadDataCalled)
    }
    
    func test_listNewsPresenter_stopsRefreshing() {
        whenPullToRefresh()
        XCTAssertTrue(stubView.isStopRefreshingCalled)
    }
    
    func test_listNewsPresenter_when_refreshing_reloadsData() {
        whenPullToRefresh()
        XCTAssertTrue(stubView.isReloadDataCalled)
    }
    
    private func whenPullToRefresh() {
        sut.view = stubView
        sut.refreshNews()
    }
    
    private func whenViewDidLoad() {
        sut.viewDidLoad(stubView)
    }
    
    override func tearDown() {
        sut = nil
    }

}
