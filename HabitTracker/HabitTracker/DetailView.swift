//
//  DetailView.swift
//  HabitTracker
//
//  Created by Okan Orkun on 12.07.2024.
//

import SwiftUI

struct DetailView: View {
    
    var activity: Activity
    var activities: Activities
    
    var body: some View {
        VStack(spacing: 20) {
            Text(activity.description)
                .font(.body)
                .padding()
            
            Text("Completion Count: \(activity.completionCount)")
                .font(.headline)
            
            Button("Increment Count") {
                activities.incrementCompletion(for: activity)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle(activity.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(activity: (Activity(title: "Deneme", description: "Deneme String")), activities: Activities())
}
