//
//  SearchableView.swift
//  SnowSeeker
//
//  Created by Okan Orkun on 30.07.2024.
//

import SwiftUI

struct SearchableView: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) {
                Text($0)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    SearchableView()
}
