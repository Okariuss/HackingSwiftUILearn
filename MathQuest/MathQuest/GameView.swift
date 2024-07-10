//
//  GameView.swift
//  MathQuest
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct GameView: View {
    
    @Binding var score: Int
    @Binding var isGameActive: Bool
    
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var showingResult = false
    @State private var gameFinished = false
    
    @FocusState private var isFocused: Bool
    
    let questions: [Question]
    let onGameEnd: () -> Void
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Score: \(score)")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            VStack {
                Text(questions[currentQuestionIndex].text)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.blue)
                    .padding()
                
                TextField("Your answer", text: $userAnswer)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .font(.title)
                    .focused($isFocused)
                
                CustomButton(
                    title: "Submit",
                    action: checkAnswer,
                    color: userAnswer.isEmpty ? .gray : .green
                )
                .padding()
                .disabled(userAnswer.isEmpty ? true : false)
            }
            .alert("Wrong Answer", isPresented: $showingResult) {
                Button("OK") {
                    userAnswer = ""
                    if currentQuestionIndex < questions.count - 1 {
                        currentQuestionIndex += 1
                    } else {
                        gameFinished = true
                    }
                }
            } message: {
                Text("\(userAnswer) is wrong. The correct answer was \(questions[currentQuestionIndex].answer).")
            }
            .alert("Game Finished", isPresented: $gameFinished) {
                Button("Restart") {
                    isGameActive = false
                    resetGame()
                }
            } message: {
                Text("Your score is \(score) out of \(questions.count) questions. To choose the multiplier and number of questions, press the Restart button.")
            }
            
            Spacer()
        }
        .onTapGesture {
            isFocused = false
        }
    }
    
    private func checkAnswer() {
        if let answer = Int(userAnswer), answer == questions[currentQuestionIndex].answer {
            score += 1
        } else {
            showingResult = true
            return
        }
        
        userAnswer = ""
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            gameFinished = true
        }
    }
    
    private func resetGame() {
        score = 0
        currentQuestionIndex = 0
        userAnswer = ""
        showingResult = false
        gameFinished = false
    }
}

#Preview {
    GameView(
        score: .constant(0),
        isGameActive: .constant(true),
        questions: [
            Question(text: "What is 2 x 3", answer: 6),
            Question(text: "What is 4 x 5", answer: 20)
        ]) {
            
        }
}
