//
//  ImageInterpoletionLearn.swift
//  HotProspects
//
//  Created by Okan Orkun on 24.07.2024.
//

import SwiftUI

struct ImageInterpoletionLearn: View {
    var body: some View {
        TabView {
            Image(.example)
                .interpolation(.high)
                .resizable()
                .scaledToFit()
                .background(.black)
                .tabItem { Label("Polation High", systemImage: "one") }
            
            Image(.example)
                .interpolation(.medium)
                .resizable()
                .scaledToFit()
                .background(.black)
                .tabItem { Label("Polation Medium", systemImage: "two") }
            
            Image(.example)
                .interpolation(.low)
                .resizable()
                .scaledToFit()
                .background(.black)
                .tabItem { Label("Polation Low", systemImage: "three") }
            
            Image(.example)
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .background(.black)
                .tabItem { Label("Polation None", systemImage: "four") }
        }
    }
}

#Preview {
    ImageInterpoletionLearn()
}
