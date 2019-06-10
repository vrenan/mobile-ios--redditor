//
//  RedditDataResponse.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation

struct RedditDataResponse: Codable {
    var children: [RedditChildrenResponse]?
    var after: String?
    var before: String?
}
