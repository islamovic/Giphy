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

    private enum CodingKeys: String, CodingKey {
        case gifs = "data"
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
}
