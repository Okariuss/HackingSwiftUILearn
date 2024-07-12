//
//  Activity.swift
//  HabitTracker
//
//  Created by Okan Orkun on 12.07.2024.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completionCount: Int = 0
}

@Observable 
final class Activities {
    var items: [Activity] = [] {
        didSet {
            saveActivities()
        }
    }
    
    init() {
        loadActivities()
    }
    
    func addActivity(_ activity: Activity) {
        items.append(activity)
    }
    
    func incrementCompletion(for activity: Activity) {
        if let index = items.firstIndex(of: activity) {
            var updatedActivity = activity
            updatedActivity.completionCount += 1
            items[index] = updatedActivity
        }
    }
    
    private func saveActivities() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "activities")
        }
    }
    
    private func loadActivities() {
        if let savedItems = UserDefaults.standard.data(forKey: "activities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = [] // If loading fails, start with an empty array
    }
}
