//
//  GiphyDetailsSceneProtocols.swift
//  Giphy
//
//  Created by Islam on 2/17/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

protocol GiphyDetailsSceneDisplayView: class {
    func display(viewModel: GiphyDetailsScene.ViewModel)
    func display(error: CustomError)
}

protocol GiphyDetailsSceneBusinessLogic: class {

}

protocol GiphyDetailsScenePresentingLogic: class {

}

protocol GiphyDetailsSceneDataStore: class {
    var originalGif: OriginalImages? { get set }
}

enum GiphyDetailsScene {
    struct ViewModel {
        var originalGif: OriginalImages
    }
}
