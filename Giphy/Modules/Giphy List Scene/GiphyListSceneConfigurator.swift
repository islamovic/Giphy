//
//  GiphyListSceneConfigurator.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class GiphyListSceneConfigurator {

    static func configure() -> GiphyListViewController {

        let viewController = GiphyListViewController()
        let presenter = GiphyListScenePresenter(displayView: viewController)
        let interactor = GiphyListSceneInteractor(presenter: presenter)
        let router = GiphyListSceneRouter(viewController: viewController, dataStore: interactor)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        viewController.router = router
        return viewController
    }
}
