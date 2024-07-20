//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Okan Orkun on 19.07.2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
