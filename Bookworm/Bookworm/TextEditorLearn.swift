//
//  TextEditorLearn.swift
//  Bookworm
//
//  Created by Okan Orkun on 20.07.2024.
//

import SwiftUI

struct TextEditorLearn: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    TextEditorLearn()
}
