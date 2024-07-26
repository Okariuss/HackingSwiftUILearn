//
//  DisableUserInteractivity.swift
//  Flashzilla
//
//  Created by Okan Orkun on 26.07.2024.
//

import SwiftUI

struct DisableUserInteractivity: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped")
                }
            
            //            Circle()
            //                .fill(.red)
            //                .frame(width: 300, height: 300)
            //                .onTapGesture {
            //                    print("Circle tapped")
            //                }
            //                .allowsHitTesting(false)
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(.rect)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(.rect)
        .onTapGesture {
            print("VStack Tapped")
        }
    }
}

#Preview {
    DisableUserInteractivity()
}
