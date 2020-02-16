//
//  GiphyListViewController.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class GiphyListViewController: UIViewController {

    var interactor: GiphyListSceneInteractor!
    var dataStore: GiphyListSceneDataStore!
    var router: GiphyListSceneRouter!

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor.fetchTrendingPosts()
    }
}

extension GiphyListViewController: GiphyListSceneDisplayView {

    func display(viewModel: GiphyListScene.ViewModel) {
        print(viewModel.trendingPosts)
    }

    func display(error: CustomError) {
        print(error.localizedDescription)
    }
}
