//
//  NewsDataSource.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation
import PromiseKit

protocol ListNewsGateway {
    func listNews() -> Promise<[News]>
}
