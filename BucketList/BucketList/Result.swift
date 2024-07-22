//
//  Result.swift
//  BucketList
//
//  Created by Okan Orkun on 22.07.2024.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [String: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: Terms?
}

struct Terms: Codable {
    let termsDescription: [String]

    enum CodingKeys: String, CodingKey {
        case termsDescription = "description"
    }
}
