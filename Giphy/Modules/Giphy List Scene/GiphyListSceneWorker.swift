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

    func fetchTrendingPosts(_ completionHandler: @escaping([Gif], CustomError?) -> Void) {

        service.listTrendingPosts { (data, error) in

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Gifs.self, from: data)
                    completionHandler(result.gifs, nil)
                } catch let error {
                    completionHandler([], CustomError.custom(error.localizedDescription))
                }
            } else if let error = error {
                completionHandler([], CustomError.custom(error.localizedDescription))
            }
        }
    }
}
