//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Okan Orkun on 20.07.2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            FilterPredicate()
        }
        .modelContainer(for: User.self)
    }
}
