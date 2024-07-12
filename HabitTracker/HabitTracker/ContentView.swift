//
//  ContentView.swift
//  HabitTracker
//
//  Created by Okan Orkun on 12.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activities = Activities()
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack {
            List(activities.items) { activity in
                
                NavigationLink {
                    DetailView(activity: activity, activities: activities)
                } label: {
                    VStack(alignment: .leading) {
                        Text(activity.title)
                            .font(.headline)
                        
                        Text(activity.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddActivityView(activities: activities)
            }
        }
    }
}

#Preview {
    ContentView()
}
