//
//  GifImages.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

struct Images: Codable {
    let original: OriginalImages

    private enum CodingKeys: String, CodingKey {
        case original = "original"
    }

}

struct OriginalImages: Codable {

    let frames: String
    let hash: String
    let height: String
    let width: String
    let size: String
    let mp4Size: String
    let mp4: String
    let url: String
    let webp: String
    let webpSize: String

    enum CodingKeys: String, CodingKey {
        case frames
        case hash
        case height
        case width
        case url
        case webp
        case mp4
        case size
        case webpSize = "webp_size"
        case mp4Size = "mp4_size"
    }
}
