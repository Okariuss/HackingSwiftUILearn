//
//  iDineApp.swift
//  iDine
//
//  Created by Okan Orkun on 8.07.2024.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
