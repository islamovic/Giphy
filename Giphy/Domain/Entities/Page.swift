//
//  Page.swift
//  Giphy
//
//  Created by Islam on 2/18/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import Foundation

struct Page: Codable {
    let total: Int
    let count: Int
    let offset: Int

    private enum CodingKeys: String, CodingKey {
        case count
        case offset
        case total = "total_count"
    }
}
