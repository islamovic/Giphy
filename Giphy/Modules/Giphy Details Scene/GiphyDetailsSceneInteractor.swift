//
//  GiphyDetailsSceneInteractor.swift
//  Giphy
//
//  Created by Islam on 2/17/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class GiphyDetailsSceneInteractor: GiphyDetailsSceneBusinessLogic, GiphyDetailsSceneDataStore {

    var originalGif: OriginalImages?

    var gifImage: UIImage?

    let presenter: GiphyDetailsScenePresentingLogic

    required init(presenter: GiphyDetailsScenePresentingLogic) {
        self.presenter = presenter
        originalGif = nil
        gifImage = nil
    }
}

extension GiphyDetailsSceneInteractor {

    func fetchGifImage(gifURL: String) {
        DispatchQueue.global().async { [weak self] in

            let image = UIImage.gif(url: gifURL)
            let response = GiphyDetailsScene.Fetch.Response.success(image)
            self?.presenter.presentDownloadedGif(response)
        }
    }

}
