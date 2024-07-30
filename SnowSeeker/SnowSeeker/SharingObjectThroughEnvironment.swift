//
//  SharingObjectThroughEnvironment.swift
//  SnowSeeker
//
//  Created by Okan Orkun on 30.07.2024.
//

import SwiftUI

@Observable
class PlayerLearn {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(PlayerLearn.self) var player
    
    var body: some View {
        @Bindable var player = player
        Stepper("High score: \(player.highScore)", value: $player.highScore)
    }
}

struct SharingObjectThroughEnvironment: View {
    @State private var player = PlayerLearn()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView()
        }
        .environment(player)
    }
}

#Preview {
    SharingObjectThroughEnvironment()
}
