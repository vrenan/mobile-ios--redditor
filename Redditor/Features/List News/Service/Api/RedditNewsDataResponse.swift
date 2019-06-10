//
//  RedditNewsDataResponse.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation

class RedditNewsDataResponse: Codable {
    var author: String
    var title: String
    var num_comments: Int
    var created: Int
    var thumbnail: String
    var url: String
}
