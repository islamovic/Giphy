//
//  GiphyDetailsViewController.swift
//  Giphy
//
//  Created by Islam on 2/17/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class GiphyDetailsViewController: UIViewController {

    @IBOutlet var originalImageView: UIImageView!

    var interactor: GiphyDetailsSceneInteractor!
    var dataStore: GiphyDetailsSceneDataStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}

extension GiphyDetailsViewController: GiphyDetailsSceneDisplayView {

    func display(viewModel: GiphyDetailsScene.ViewModel) {
        dataStore.originalGif = viewModel.originalGif
    }

    func display(error: CustomError) {

    }
}

private extension GiphyDetailsViewController {

    func updateUI() {
        originalImageView.image = UIImage.gif(url: dataStore.originalGif!.url)
    }
}
