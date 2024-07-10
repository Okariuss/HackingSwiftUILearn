//
//  SettingsView.swift
//  MathQuest
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var multiplicationTable: Int
    @Binding var numberOfQuestions: Int
    
    @State private var animationAmount = 1.0
    
    let onStartGame: () -> Void
    
    var body: some View {
        Text("Multiplication Fun!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.blue)
            .padding()
        
        VStack(spacing: 20) {
            Text("Select multiplication table")
                .font(.headline)
            
            HStack {
                ForEach(2..<8) { number in
                    CustomButton(title: "\(number)", action: {
                        multiplicationTable = number
                    }, color: multiplicationTable == number ? .green : .blue
                    )
                }
            }
            
            HStack {
                ForEach(8..<14) { number in
                    CustomButton(
                        title: "\(number)",
                        action: {
                            multiplicationTable = number
                        }, color: multiplicationTable == number ? .green : .blue
                    )
                }
            }
        }
        .padding()
        
        VStack(spacing: 20) {
            Text("Number of questions")
                .font(.headline)
            
            HStack {
                ForEach(1..<5) { number in
                    CustomButton(
                        title: "\(number * 5)",
                        action: {
                            numberOfQuestions = number * 5
                        }, color: numberOfQuestions == number * 5 ? .green : .blue
                    )
                }
            }
        }
        .padding()
        
        CustomButton(
            title: "Start Game",
            action: onStartGame,
            color: .purple
        )
        .padding()
        .scaleEffect(animationAmount)
        .animation(
            .easeInOut(duration: 1)
            .repeatForever(autoreverses: true),
            value: animationAmount
        )
        .onAppear {
            animationAmount = 1.2
        }
    }
}

#Preview {
    SettingsView(
        multiplicationTable: .constant(2),
        numberOfQuestions: .constant(5)) {
            
        }
}
