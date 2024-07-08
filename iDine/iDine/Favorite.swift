//
//  Favorite.swift
//  iDine
//
//  Created by Okan Orkun on 8.07.2024.
//

import Foundation

final class Favorite: ObservableObject {
    @Published var items = [MenuItem]()
    
    func isFavorite(item: MenuItem) -> Bool {
        return items.contains(item)
    }
    
    func toggle(item: MenuItem) {
        items.contains(item) ? remove(item: item) : add(item: item)
    }
    
    private func add(item: MenuItem) {
        items.append(item)
    }
    
    private func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
