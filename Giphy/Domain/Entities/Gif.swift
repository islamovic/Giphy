//
//  Gif.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

struct Gifs: Codable {
    let gifs: [Gif]
    let page: Page

    private enum CodingKeys: String, CodingKey {
        case gifs = "data"
        case page = "pagination"
    }
}

struct Gif: Codable {

    let type: String
    let id: String
    let url: String
    let slug: String
    let username: String
    let title: String
    let rating: String
    let images: Images
    let user: User?

    init(id: String, title: String, originalUrl: String, previewUrl: String?) {
        self.id = id
        self.title = title
        self.type = ""
        self.url = ""
        self.slug = ""
        self.username = ""
        self.rating = ""
        self.images = Images(original: OriginalImages(url: originalUrl),
                             preview: Preview(url: previewUrl))
        self.user = nil
    }
}
