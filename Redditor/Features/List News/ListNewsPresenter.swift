//
//  ListNewsViewModel.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation

class ListNewsPresenter {
    
    private var models:[News]
    private var gateway: ListNewsGateway
    
    var view: ListNewsView?
    
    init(gateway:ListNewsGateway = RedditService()) {
        self.models = []
        self.gateway = gateway
    }
    
    func numberOfRows() -> Int {
        return models.count
    }
    
    func modelForRow(at index:IndexPath) -> News {
        return models[index.row]
    }
    
    func viewDidLoad(_ view: ListNewsView) {
        self.view = view
        self.view?.startLoading()
        _ = gateway.listNews().done(handleNews).catch({ error in
            print(error)
        })
    }
    
    func viewWillDisappear() {
        view = nil
    }
    
    private func handleNews( _ news: [News]) {
        self.view?.stopLoading()
        self.models = news
        self.view?.reloadData()
    }
}
