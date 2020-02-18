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
        dataStore.originalGif = viewModel.originalGif
    }

    func display(error: CustomError) {

    }
}

private extension GiphyDetailsViewController {

    func updateUI() {
        DispatchQueue.global().async { [weak self] in
            let url = (self?.dataStore.originalGif!.url)!
            let gifImage = UIImage.gif(url: url)
            DispatchQueue.main.async {
                self?.gifActivityIndicator.isHidden = true
                self?.originalImageView.image = gifImage
            }
        }
    }
}
