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

        setup()
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

    func setup() {
        gifActivityIndicator.isHidden = false
        updateUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
    }

    func updateUI() {
        interactor.fetchGifImage(gifURL: self.dataStore.originalGif!.url)
    }

    @objc func doneTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
