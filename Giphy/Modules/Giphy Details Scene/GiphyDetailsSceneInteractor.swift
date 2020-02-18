//
//  GiphyDetailsSceneInteractor.swift
//  Giphy
//
//  Created by Islam on 2/17/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class GiphyDetailsSceneInteractor: GiphyDetailsSceneBusinessLogic, GiphyDetailsSceneDataStore {

    var originalGif: OriginalImages?

    let presenter: GiphyDetailsScenePresentingLogic

    required init(presenter: GiphyDetailsScenePresentingLogic) {
        self.presenter = presenter
        originalGif = nil
    }
}
