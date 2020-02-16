//
//  User.swift
//  Giphy
//
//  Created by Islam on 2/16/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

struct User: Codable {

    let avatarURL: String
    let bannerURL: String
    let profileURL: String
    let username: String
    let displayNamee: String
    let isVerified: Bool

    private enum CodingKeys: String, CodingKey {
        case username

        case avatarURL = "avatar_url"
        case bannerURL = "banner_url"
        case profileURL = "profile_url"
        case displayNamee = "display_name"
        case isVerified = "is_verified"
    }
}
