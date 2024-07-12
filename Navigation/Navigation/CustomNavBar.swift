//
//  CustomNavBar.swift
//  Navigation
//
//  Created by Okan Orkun on 12.07.2024.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        NavBarBackground()
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
