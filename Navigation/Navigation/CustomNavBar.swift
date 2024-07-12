//
//  CustomNavBar.swift
//  Navigation
//
//  Created by Okan Orkun on 12.07.2024.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        ToolbarExactLocation()
    }
}

struct ToolbarExactLocation: View {
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            
                        }
                        
                        Button("Or Tap Me") {
                            
                        }
                    }
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Tap Me") {
//                            
//                        }
//                    }
//                    
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Or Tap Me") {
//                            
//                        }
//                    }
                }
        }
    }
}

struct NavBarBackground: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    CustomNavBar()
}
