//
//  EditView.swift
//  BucketList
//
//  Created by Okan Orkun on 22.07.2024.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    var onSave: (Location) -> Void
    
    @State private var name: String
    @State private var description: String
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place Name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditView(location: .example) { _ in }
}