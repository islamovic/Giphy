//
//  GiphyDetailsSceneProtocols.swift
//  Giphy
//
//  Created by Islam on 2/17/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

protocol GiphyDetailsSceneDisplayView: class {
    func display(viewModel: GiphyDetailsScene.ViewModel)
    func display(error: CustomError)
}

protocol GiphyDetailsSceneBusinessLogic: class {
    func fetchGifImage(gifURL: String)
}

protocol GiphyDetailsScenePresentingLogic: class {
    func presentDownloadedGif(_ response: GiphyDetailsScene.Fetch.Response)
}

protocol GiphyDetailsSceneDataStore: class {
    var originalGif: OriginalImages? { get set }
    var gifImage: UIImage? { get set }
}

enum GiphyDetailsScene {
    struct ViewModel {
        var gif: UIImage?
    }
}

extension GiphyDetailsScene {
    enum Fetch { }
}

extension GiphyDetailsScene.Fetch {
    typealias Response = Result<UIImage?, CustomError>
}
