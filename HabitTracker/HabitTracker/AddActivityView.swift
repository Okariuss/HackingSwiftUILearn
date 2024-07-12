//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Okan Orkun on 12.07.2024.
//

import SwiftUI

struct AddActivityView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var activities: Activities
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    let activity = Activity(title: title, description: description)
                    activities.addActivity(activity)
                    dismiss()
                }
                .disabled(title.isEmpty || description.isEmpty)
            }
        }
    }
}

#Preview {
    return AddActivityView(activities: Activities())
}
