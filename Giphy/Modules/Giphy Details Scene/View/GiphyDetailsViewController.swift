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
    @IBOutlet var gifActivityIndicator: UIActivityIndicatorView!

    var interactor: GiphyDetailsSceneInteractor!
    var dataStore: GiphyDetailsSceneDataStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        gifActivityIndicator.isHidden = false
        updateUI()
    }
}

extension GiphyDetailsViewController: GiphyDetailsSceneDisplayView {

    func display(viewModel: GiphyDetailsScene.ViewModel) {

        dataStore.gifImage = viewModel.gif
        DispatchQueue.main.async { [weak self] in
            self?.gifActivityIndicator.isHidden = true
            self?.originalImageView.image = self?.dataStore.gifImage
        }
    }

    func display(error: CustomError) {
        showAlert(title: "Fetching Gif", message: error.localizedDescription)
    }
}

private extension GiphyDetailsViewController {

    func updateUI() {
        interactor.fetchGifImage(gifURL: self.dataStore.originalGif!.url)
    }
}
