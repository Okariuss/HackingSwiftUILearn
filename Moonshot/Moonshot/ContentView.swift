//
//  ContentView.swift
//  Moonshot
//
//  Created by Okan Orkun on 11.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        
        Text("\(astronauts.count)")
        
    }
}

#Preview {
    ContentView()
}
