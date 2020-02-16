//
//  GiphyListSceneRouter.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class GiphyListSceneRouter: GiphyListSceneRoutingLogic {

    weak var viewController: (UIViewController & GiphyListSceneDisplayView)?
    weak var dataStore: GiphyListSceneDataStore?

    required init(viewController: (UIViewController & GiphyListSceneDisplayView), dataStore: GiphyListSceneDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension GiphyListSceneRouter {
    func routeToInfoScene(with gif: Gif) {

    }
}
