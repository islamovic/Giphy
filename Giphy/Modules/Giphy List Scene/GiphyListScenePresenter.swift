//
//  GiphyListScenePresenter.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class GiphyListScenePresenter: GiphyListScenePresentingLogic {

    weak var displayView: GiphyListSceneDisplayView?

    required init(displayView: GiphyListSceneDisplayView) {
        self.displayView = displayView
    }
}

extension GiphyListScenePresenter {

    func presentFetchedTrendingPosts(_ response: GiphyListScene.Fetch.Response) {
        switch response {
            case .success(let gifs):
                let viewModel = GiphyListScene.ViewModel(trendingPosts: gifs)
                displayView?.display(viewModel: viewModel)
            case .error(let error):
                displayView?.display(error: error)
        }
    }
}
