//
//  Location.swift
//  BucketList
//
//  Created by Okan Orkun on 21.07.2024.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
