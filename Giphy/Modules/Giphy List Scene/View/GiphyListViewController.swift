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

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        interactor.fetchTrendingPosts()
    }
}

extension GiphyListViewController: GiphyListSceneDisplayView {

    func display(viewModel: GiphyListScene.ViewModel) {
        dataStore.treendingPosts = viewModel.trendingPosts
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

    func display(error: CustomError) {
        print(error.localizedDescription)
    }
}


extension GiphyListViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataStore.treendingPosts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GifCell = collectionView.dequeReusableCell(indexPath: indexPath)
        let trendGif = dataStore.treendingPosts[indexPath.row]

        if dataStore.cachedGifs[trendGif.id] != nil {
            cell.gifImageView.image = dataStore.cachedGifs[trendGif.id]!
        } else {
            cell.configure(gif: trendGif) { [weak self] (gifImages) in
                self?.dataStore.cachedGifs[trendGif.id] = gifImages
                DispatchQueue.main.async {
                    cell.gifImageView.image = gifImages
                }
            }
        }

        return cell
    }
}

extension GiphyListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let cellSize = (width / 2) - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}


private extension GiphyListViewController {

    func setup() {
        self.title = "Trending"
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.register(GifCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
