//
//  ContentUnavailableViewLearn.swift
//  Instafilter
//
//  Created by Okan Orkun on 21.07.2024.
//

import SwiftUI

struct ContentUnavailableViewLearn: View {
    var body: some View {
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentUnavailableViewLearn()
}
