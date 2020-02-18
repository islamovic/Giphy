//
//  GitNetworkService.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

public class GifNetworkService {

    public func listTrendingPosts(offset: Int, limit: Int,
                                  completion: @escaping(Data?, Error?) -> Void) {
        let path = "trending"
        let parameters = ["api_key": Constants.Server.APIKey,
                          "limit": "\(limit)",
                          "offset": "\(offset)",
                          "rating": "pg"]
        let trendingPostsEndPoint = EndPoint(path: path, parameters: parameters, method: .get)

        Router.shared.request(trendingPostsEndPoint, success: { (data, response) in
            completion(data, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
}
