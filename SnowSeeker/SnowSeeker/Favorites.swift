//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Okan Orkun on 31.07.2024.
//

import Foundation

@Observable
final class Favorites {
    // The actual resorts the user has favorited
    private var resorts: Set<String>
    
    // The key we're using to read/write in UserDefaults
    private let key = "Favorites"
    
    init() {
        // load our saved data
        if let savedData = UserDefaults.standard.object(forKey: key) as? [String] {
            resorts = Set(savedData)
        } else {
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(Array(resorts), forKey: key)
    }
}
