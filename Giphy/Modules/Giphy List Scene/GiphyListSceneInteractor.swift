//
//  GiphyListSceneInteractor.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit
import Foundation

class GiphyListSceneInteractor: GiphyListSceneBusinessLogic, GiphyListSceneDataStore {

    let presenter: GiphyListScenePresentingLogic

    var treendingPosts: [Gif]

    var cachedGifs: [String : UIImage?]

    var pagination: Page?

    let worker = GiphyListSceneWorker()

    required init(presenter: GiphyListScenePresentingLogic) {
        self.presenter = presenter
        treendingPosts = []
        cachedGifs = [:]
        pagination = nil
    }
}

extension GiphyListSceneInteractor {

    func fetchTrendingPosts(offset: Int, limit: Int) {
        worker.fetchTrendingPosts(offset: offset, limit: limit) { (results, error) in

            if let error = error {
                let response = GiphyListScene.Fetch.Response.error(error)
                self.presenter.presentFetchedTrendingPosts(response)
            } else if let results = results {
                let response = GiphyListScene.Fetch.Response.success(results)
                self.presenter.presentFetchedTrendingPosts(response)
            }
        }
    }

    func fetchGifImage(gif: Gif, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            let url = gif.images.preview.url ?? gif.images.original.url
            let image = UIImage.gif(url: url)
            completion(image)
        }
    }
}
