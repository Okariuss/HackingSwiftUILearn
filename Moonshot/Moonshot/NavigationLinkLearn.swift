//
//  NavigationLinkLearn.swift
//  Moonshot
//
//  Created by Okan Orkun on 11.07.2024.
//

import SwiftUI

struct NavigationLinkLearn: View {
    var body: some View {
        
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
        
//        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
//        }
    }
}

#Preview {
    NavigationLinkLearn()
}
