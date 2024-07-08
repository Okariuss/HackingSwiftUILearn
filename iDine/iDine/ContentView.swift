//
//  ContentView.swift
//  iDine
//
//  Created by Okan Orkun on 8.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    ContentView()
}
