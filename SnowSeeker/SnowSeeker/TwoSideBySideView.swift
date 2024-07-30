//
//  TwoSideBySideView.swift
//  SnowSeeker
//
//  Created by Okan Orkun on 30.07.2024.
//

import SwiftUI

struct TwoSideBySideView: View {
    var body: some View {
//        NavigationSplitView(columnVisibility: .constant(.all)) {
//            NavigationLink("Primary") {
//                Text("New View")
//            }
//        } detail: {
//            Text("Content")
//                .navigationTitle("Content View")
//        }
//        .navigationSplitViewStyle(.balanced)
        
        
        NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
            NavigationLink("Primary") {
                Text("New View")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    TwoSideBySideView()
}
