//
//  GitNetworkService.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

public class GifNetworkService {

    public func listTrendingPosts(completion: @escaping(Data?, Error?) -> Void) {
        let path = "trending"
        let parameters = ["api_key": "1L9rTdIySwunODKuMPXO26SyDkyjm6Cj",
                          "limit": "20",
                          "offset": "25",
                          "rating": "pg"]
        let trendingPostsEndPoint = EndPoint(path: path, parameters: parameters, method: .get)

        Router.shared.request(trendingPostsEndPoint, success: { (data, response) in
            completion(data, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
}
