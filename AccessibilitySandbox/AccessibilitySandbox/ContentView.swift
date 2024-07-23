//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Okan Orkun on 23.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HandlingVoiceInput()
    }
}

struct HandlingVoiceInput: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kenned", "Kennedy", "JFK"])
    }
}

struct ReadingValueOfControls: View {
    
    @State private var value = 10
    var body: some View {
        VStack {
            Text("Value \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled.")
            }
        }
    }
}

struct HidingAndGroupingData: View {
    var body: some View {
        Image(.character)
            .accessibilityHidden(true)
        
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Your score is 1000")
    }
}

struct IdentifyingViewsWithLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Button {
            selectedPicture = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .accessibilityLabel(labels[selectedPicture])
                .accessibilityAddTraits(.isButton)
                .accessibilityRemoveTraits(.isImage)
        }
    }
}

#Preview {
    ContentView()
}
