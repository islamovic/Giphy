//
//  GiphyListSceneProtocols.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

// MARK: - View
protocol GiphyListSceneDisplayView: class {
    func display(viewModel: GiphyListScene.ViewModel)
    func display(error: CustomError)
}

// MARK: - Interactor
protocol GiphyListSceneBusinessLogic: class {
    func fetchTrendingPosts(offset: Int, limit: Int)
}

// MARK: - Presenter
protocol GiphyListScenePresentingLogic: class {
    func presentFetchedTrendingPosts(_ response: GiphyListScene.Fetch.Response)
}

// MARK: - Router
protocol GiphyListSceneRoutingLogic: class {
    var viewController: (GiphyListSceneDisplayView & UIViewController)? { get set }
    var dataStore: GiphyListSceneDataStore? { get set }

    func routeToInfoScene(with gif: Gif)
}

// MARK: - Data Store
protocol GiphyListSceneDataStore: class {
    var treendingPosts: [Gif] { get set }
    var pagination: Page? { get set }
    var cachedGifs: [String: UIImage?] { get set }
}

// MARK: - Scene Model
enum GiphyListScene {
    struct ViewModel {
        var result: Output
    }

    struct Output {
        let trendingPosts: [Gif]
        let pagination: Page
    }
}

extension GiphyListScene {
    enum Fetch { }
}

extension GiphyListScene.Fetch {
    typealias Response = Result<GiphyListScene.Output, CustomError>
}
