//
//  RedditNewsDataResponse.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation

struct RedditNewsDataResponse: Codable {
    let author: String
    let title: String
    let num_comments: Int
    let subreddit_name_prefixed: String
    let created: Int
    let thumbnail: String
    let url: String
    let permalink: String
    
    enum CodingKeys: String, CodingKey {
        case subreddit_name_prefixed = "subreddit_name_prefixed"
        case author = "author"
        case title = "title"
        case num_comments = "num_comments"
        case created = "created"
        case thumbnail = "thumbnail"
        case url = "url"
        case permalink = "permalink"
    }
}
