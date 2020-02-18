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
    let preview: Preview

    init(original: OriginalImages, preview: Preview) {
        self.original = original
        self.preview = preview
    }

    private enum CodingKeys: String, CodingKey {
        case original = "original"
        case preview = "preview_gif"
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

    init(url: String) {
        self.url = url
        self.frames = ""
        self.hash = ""
        self.height = ""
        self.width = ""
        self.size = ""
        self.mp4Size = ""
        self.mp4 = ""
        self.webp = ""
        self.webpSize = ""
    }

    private enum CodingKeys: String, CodingKey {
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

struct Preview: Codable {
    let url: String?
    let height: String?
    let width: String?
    let size: String?

    init(url: String?) {
        self.url = url
        self.height = nil
        self.width = nil
        self.size = nil
    }
}
