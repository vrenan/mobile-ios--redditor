//
//  ListNewsController.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListNewsController: UITableViewController {
    
    private let presenter = ListNewsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(self)
        prepare(tableView)
    }

    private func prepare(_ tableView: UITableView) {
        refreshControl = createRefreshControl()
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func createRefreshControl() -> UIRefreshControl {
        let control = UIRefreshControl()
        control.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        control.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
        return control
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewViewCell.identifier, for: indexPath) as? NewViewCell else {
            fatalError("NewViewCell not found")
        }
        cell.prepare(with: presenter.modelForRow(at: indexPath))
        return cell
    }
    
    @objc func refreshNews() {
        presenter.refreshNews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.viewWillDisappear()
    }
}

