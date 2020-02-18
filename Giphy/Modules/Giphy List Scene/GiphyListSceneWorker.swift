//
//  GiphyListSceneWorker.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class GiphyListSceneWorker {

    private let service = GifNetworkService()

    func fetchTrendingPosts(offset: Int, limit: Int,
                            _ completionHandler: @escaping(GiphyListScene.Output?, CustomError?) -> Void) {

        service.listTrendingPosts(offset: offset, limit: limit) { (data, error) in

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Gifs.self, from: data)
                    let output = GiphyListScene.Output(trendingPosts: result.gifs, pagination: result.page)
                    completionHandler(output, nil)
                } catch let error {
                    completionHandler(nil, CustomError.custom(error.localizedDescription))
                }
            } else if let error = error {
                completionHandler(nil, CustomError.custom(error.localizedDescription))
            }
        }
    }
}
