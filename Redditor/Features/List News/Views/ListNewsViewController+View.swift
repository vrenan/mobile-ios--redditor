//
//  ListNewsViewController+View.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol ListNewsView {
    func startLoading()
    func stopLoading()
    func reloadData()
    func stopRefreshing()
}

extension ListNewsController: ListNewsView {
    func startLoading() {
        SVProgressHUD.show()
    }
    
    func stopLoading() {
        SVProgressHUD.dismiss()
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func stopRefreshing() {
        self.refreshControl?.endRefreshing()
    }
}
