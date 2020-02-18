//
//  GiphyDetailsSceneConfigurator.swift
//  Giphy
//
//  Created by Islam on 2/17/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

class GiphyDetailsSceneConfigurator {

    static func configure() -> GiphyDetailsViewController {
        let viewController = GiphyDetailsViewController ()
        let presenter = GiphyDetailsScenePresenter(displayView: viewController)
        let interactor = GiphyDetailsSceneInteractor(presenter: presenter)
        
        viewController.interactor = interactor
        viewController.dataStore = interactor
        return viewController

    }
}
