//
//  AppGoesBackground.swift
//  Flashzilla
//
//  Created by Okan Orkun on 26.07.2024.
//

import SwiftUI

struct AppGoesBackground: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, World!")
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    AppGoesBackground()
}
