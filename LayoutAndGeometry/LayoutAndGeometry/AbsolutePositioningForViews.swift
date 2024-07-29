//
//  AbsolutePositioningForViews.swift
//  LayoutAndGeometry
//
//  Created by Okan Orkun on 29.07.2024.
//

import SwiftUI

struct AbsolutePositioningForViews: View {
    var body: some View {
        Text("Hello, World!")
            .background(.blue)
            .offset(x: 100, y: 100)
            .background(.red)
    }
}

#Preview {
    AbsolutePositioningForViews()
}
