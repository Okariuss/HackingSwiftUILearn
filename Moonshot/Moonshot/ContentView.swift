//
//  ContentView.swift
//  Moonshot
//
//  Created by Okan Orkun on 11.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        
        Text("\(astronauts.count)")
        
    }
}

#Preview {
    ContentView()
}
