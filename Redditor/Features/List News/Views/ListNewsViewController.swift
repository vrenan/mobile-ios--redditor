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
    
    let presenter = ListNewsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(self)
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
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.viewWillDisappear()
    }
}

