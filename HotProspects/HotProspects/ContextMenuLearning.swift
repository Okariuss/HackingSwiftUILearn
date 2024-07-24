//
//  ContextMenuLearning.swift
//  HotProspects
//
//  Created by Okan Orkun on 24.07.2024.
//

import SwiftUI

struct ContextMenuLearning: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, world")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu(ContextMenu {
                    Button("Red", systemImage: "checkmark.circle.fill") {
                        backgroundColor = .red
                    }
                    Button("Green") {
                        backgroundColor = .green
                    }
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                })
        }
    }
}

#Preview {
    ContextMenuLearning()
}
