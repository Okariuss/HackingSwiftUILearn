//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Okan Orkun on 29.07.2024.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .global).minY
                        let opacity = calculateOpacity(for: offset)
                        let scale = calculateScale(for: offset, fullHeight: fullView.size.height)
                        let hue = calculateHue(for: offset, fullHeight: fullView.size.height)
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: hue, saturation: 0.8, brightness: 0.9, opacity: opacity))
                            .opacity(opacity)
                            .scaleEffect(scale)
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    func calculateOpacity(for offset: CGFloat) -> Double {
        let startFadingOffset: CGFloat = 200
        let endFadingOffset: CGFloat = 0
        if offset > startFadingOffset {
            return 1.0
        } else if offset < endFadingOffset {
            return 0.0
        } else {
            return Double((offset - endFadingOffset) / (startFadingOffset - endFadingOffset))
        }
    }
    
    func calculateScale(for offset: CGFloat, fullHeight: CGFloat) -> CGFloat {
        let minScale: CGFloat = 0.5
        let maxScale: CGFloat = 1.0
        
        let distanceFromBottom = fullHeight - offset
        let maxDistance = fullHeight
        
        let scale = minScale + (maxScale - minScale) * (distanceFromBottom / maxDistance)
        
        return max(minScale, min(scale, maxScale))
    }
    
    func calculateHue(for topDistance: CGFloat, fullHeight: CGFloat) -> CGFloat {
        Double(topDistance / fullHeight)
    }
}

#Preview {
    ContentView()
}
