//
//  RedditService+DataSource.swift
//  Redditor
//
//  Created by Victor Ferreira on 10/06/19.
//  Copyright © 2019 vrenan. All rights reserved.
//

import Foundation
import PromiseKit

class RedditService: ListNewsGateway {
    
    func listNews() -> Promise<[News]> {
        return Promise { seal in
            let urlString = "https://www.reddit.com/top.json?limit=20"
            let url = URL(string: urlString)!
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data,
                    let result = try? JSONDecoder().decode(RedditNewsResponse.self, from: data) else {
                        let genericError = NSError(
                            domain: "Redditor",
                            code: 0,
                            userInfo: [NSLocalizedDescriptionKey: "Erro Desconhecido"])
                        seal.reject(error ?? genericError)
                        return
                }
                
                seal.fulfill(self.map(result))
                }.resume()
        }
    }
    
    func map(_ response: RedditNewsResponse) -> [News] {
        
        guard let children = response.data.children else {
            return [News]()
        }
        
        return children.compactMap { (redditResponse) -> News in
            let data = redditResponse.data
            
            return News(author: data.author,
                        title: data.title,
                        numberComments: data.num_comments,
                        created: data.created,
                        thumbnail: URL(string: data.thumbnail)!,
                        url: URL(string: data.url)!,
                        permalink: create(permalink: data.permalink),
                        subredit: data.subreddit_name_prefixed
            )
        }
    }
    
    func create(permalink: String) -> URL {
        return URL(string: "https://www.reddit.com\(permalink)")!
    }
}
