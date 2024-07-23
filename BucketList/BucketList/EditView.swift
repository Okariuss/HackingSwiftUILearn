//
//  EditView.swift
//  BucketList
//
//  Created by Okan Orkun on 22.07.2024.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    var onSave: (Location) -> Void
    
    @State private var viewModel: ViewModel
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self._viewModel = State(initialValue: ViewModel(location: location))
        self.onSave = onSave
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place Name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby…") {
                    switch viewModel.loadingState {
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button("Save") {
                    onSave(viewModel.save())
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
}

#Preview {
    EditView(location: .example) { _ in }
}
