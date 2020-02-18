//
//  GiphyDetailsScenePresenter.swift
//  Giphy
//
//  Created by Islam on 2/17/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class GiphyDetailsScenePresenter: GiphyDetailsScenePresentingLogic {

    weak var displayView: GiphyDetailsSceneDisplayView?

    required init(displayView: GiphyDetailsSceneDisplayView) {
        self.displayView = displayView
    }
}

extension GiphyDetailsScenePresenter {

    func presentDownloadedGif(_ response: GiphyDetailsScene.Fetch.Response) {

        switch response {
            case .success(let gifImage):
                let viewModel = GiphyDetailsScene.ViewModel(gif: gifImage)
                displayView?.display(viewModel: viewModel)
            case .error(let error):
                displayView?.display(error: error)
        }
    }
}
