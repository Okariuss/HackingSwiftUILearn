//
//  GesturesLearn.swift
//  Flashzilla
//
//  Created by Okan Orkun on 25.07.2024.
//

import SwiftUI

struct GesturesLearn: View {
    var body: some View {
        Text("Double Tap")
            .onTapGesture(count: 2) {
                print("Double Tapped")
            }
        
        Text("Long pressed")
            .onLongPressGesture {
                print("Long Pressed")
            }
        
        Text("Long pressed With Duration")
            .onLongPressGesture(minimumDuration: 2) {
                print("Long Pressed With Duration")
            }
        
        Text("Long press, duration and in progress")
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)!")
            }
    }
}

struct MagnifyGestureLearn: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

struct RotateGestureLearn: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Text("Hello, World!")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAmount = value.rotation
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    }
            )
    }
}

struct PriorityGestureLearn: View {
    var body: some View {
        
        VStack {
            Text("Child first")
                .onTapGesture {
                    print("Child Tapped")
                }
        }
        .onTapGesture {
            print("VStack Tapped")
        }
        
        VStack {
            Text("VStack First")
                .onTapGesture {
                    print("Text Tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded {
                    print("VStack Tapped")
                }
        )
        
        VStack {
            Text("Both")
                .onTapGesture {
                    print("Text Tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("VStack Tapped")
                }
        )
    }
}

struct CombinedGesturesLearn: View {
    // How far the circle has been dragged
    @State private var offset = CGSize.zero
    
    // Whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

#Preview {
    CombinedGesturesLearn()
}
