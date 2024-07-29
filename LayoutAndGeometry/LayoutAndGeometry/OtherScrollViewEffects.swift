//
//  OtherScrollViewEffects.swift
//  LayoutAndGeometry
//
//  Created by Okan Orkun on 29.07.2024.
//

import SwiftUI

struct OtherScrollViewEffects: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .frame(width: 200, height: 200)
                            .visualEffect { content, geometryProxy in
                                content.rotation3DEffect(.degrees(-geometryProxy.frame(in: .global).minX) / 8 , axis: (x: 0, y: 1, z: 0))
                            }
                }
            }
        }
    }
}

#Preview {
    OtherScrollViewEffects()
}
