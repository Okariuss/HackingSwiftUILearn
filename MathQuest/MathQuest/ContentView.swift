//
//  ContentView.swift
//  MathQuest
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGameActive = false
    @State private var multiplicationTable = 9
    @State private var numberOfQuestions = 5
    @State private var questions = [Question]()
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            if isGameActive {
                GameView(score: $score, isGameActive: $isGameActive, questions: questions, onGameEnd: endGame)
            } else {
                SettingsView(multiplicationTable: $multiplicationTable, numberOfQuestions: $numberOfQuestions, onStartGame: startGame)
            }
        }
    }
    
    private func startGame() {
        questions = generateQuestions()
        score = 0
        isGameActive = true
    }
    
    private func endGame() {
        isGameActive = false
    }
    
    private func generateQuestions() -> [Question] {
        var newQuestions = [Question]()
        
        for _ in 0..<numberOfQuestions {
            let multiplier = Int.random(in: 1...multiplicationTable)
            let question = Question(
                text: "What is \(multiplicationTable) x \(multiplier)",
                answer: multiplicationTable * multiplier
            )
            
            newQuestions.append(question)
        }
        
        return newQuestions
    }
}

#Preview {
    ContentView()
}
