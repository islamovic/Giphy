//
//  GiphyListSceneInteractor.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class GiphyListSceneInteractor: GiphyListSceneBusinessLogic, GiphyListSceneDataStore {

    let presenter: GiphyListScenePresentingLogic

    var treendingPosts: [Gif]

    let worker = GiphyListSceneWorker()

    required init(presenter: GiphyListScenePresentingLogic) {
        self.presenter = presenter
        treendingPosts = []
    }
}

extension GiphyListSceneInteractor {

    func fetchTrendingPosts() {
        worker.fetchTrendingPosts { (trendingPosts, error) in

            if let error = error {
                let response = GiphyListScene.Fetch.Response.error(error)
                self.presenter.presentFetchedTrendingPosts(response)
            } else {
                let response = GiphyListScene.Fetch.Response.success(trendingPosts)
                self.presenter.presentFetchedTrendingPosts(response)
            }
        }
    }
}
