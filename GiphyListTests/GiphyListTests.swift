//
//  GiphyListTests.swift
//  GiphyListTests
//
//  Created by Islam on 2/18/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import XCTest
@testable import Giphy

class GiphyListTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyPreview() {

        let preview = Preview(url: nil)
        let original = OriginalImages(url: "https://media1.giphy.com/media/gdZdXMTxxsV8D6fumt/giphy.gif?&rid=giphy.gif")

        let presentSpy = PresenterSpy()
        let interactor = GiphyListSceneInteractor(presenter: presentSpy)

        let gif = Gif(id: "gdZdXMTxxsV8D6fumt", title: "I Love You Hug GIF by moodman", originalUrl: original.url, previewUrl: preview.url)

        let expectation = self.expectation(description: "downloading images")
        var downloadedImage: UIImage?

        interactor.fetchGifImage(gif: gif) { (image) in
            downloadedImage = image

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotEqual(downloadedImage, nil)
    }

    func testPreview() {
        let preview = Preview(url: "https://media1.giphy.com/media/gdZdXMTxxsV8D6fumt/giphy-preview.gif?cid=443e3475fcf19f02ff0485206558d58c2f1dcf774a76d720&rid=giphy-preview.gif")
        let original = OriginalImages(url: "https://media1.giphy.com/media/gdZdXMTxxsV8D6fumt/giphy.gif?&rid=giphy.gif")

        let presentSpy = PresenterSpy()
        let interactor = GiphyListSceneInteractor(presenter: presentSpy)

        let gif = Gif(id: "gdZdXMTxxsV8D6fumt", title: "I Love You Hug GIF by moodman", originalUrl: original.url, previewUrl: preview.url)

        let expectation = self.expectation(description: "downloading images")
        var downloadedImage: UIImage?

        interactor.fetchGifImage(gif: gif) { (image) in
            downloadedImage = image

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotEqual(downloadedImage, nil)
    }

    func testEmptyPreviewAndCorupptedOriginalURL() {
        let preview = Preview(url: nil)
        let original = OriginalImages(url: "https://media1?&rid=giphy.gif")

        let presentSpy = PresenterSpy()
        let interactor = GiphyListSceneInteractor(presenter: presentSpy)

        let gif = Gif(id: "gdZdXMTxxsV8D6fumt", title: "I Love You Hug GIF by moodman", originalUrl: original.url, previewUrl: preview.url)

        let expectation = self.expectation(description: "downloading images")
        var downloadedImage: UIImage?

        interactor.fetchGifImage(gif: gif) { (image) in
            downloadedImage = image

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(downloadedImage, nil)
    }
}

extension GiphyListTests {

    class PresenterSpy: GiphyListScenePresentingLogic {
        var fetchedGifsResponse: GiphyListScene.Fetch.Response?

        func presentFetchedTrendingPosts(_ response: GiphyListScene.Fetch.Response) {
            fetchedGifsResponse = response
        }
    }
}
