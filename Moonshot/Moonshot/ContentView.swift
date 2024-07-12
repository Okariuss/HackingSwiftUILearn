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
    
    @State private var isGridView: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if isGridView {
                    MissionGridView(missions: missions, astronauts: astronauts)
                } else {
                    MissionListView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(Color.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isGridView.toggle()
                        }
                    }) {
                        Image(systemName: isGridView ? "list.bullet" : "square.grid.2x2")
                            .imageScale(.large)
                            .foregroundStyle(.white)
                    }
                }
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
}

struct MissionGridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                MissionItemView(mission: mission, astronauts: astronauts)
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct MissionListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        LazyVStack {
            ForEach(missions) { mission in
                MissionItemView(mission: mission, astronauts: astronauts)
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct MissionItemView: View {
    let mission: Mission
    let astronauts: [String: Astronaut]
    @State private var isVisible = false
    
    var body: some View {
        NavigationLink(value: mission) {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                
                VStack {
                    Text(mission.displayName)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(mission.formattedLaunchDate)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.5))
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.lightBackground)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.lightBackground)
            }
            .opacity(isVisible ? 1 : 0)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5)) {
                    isVisible = true
                }
            }
            .onDisappear {
                isVisible = false
            }
        }
    }
}

#Preview {
    ContentView()
}
