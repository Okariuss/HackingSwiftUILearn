//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Okan Orkun on 9.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    let winnerMoves = ["Paper", "Scissors", "Rock"]
    let totatGame = 10
    
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 0
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Score: \(score)")
                .font(.largeTitle)
            
            Spacer()
            
            Text("App's move \(moves[appMove])")
                .font(.largeTitle)
            
            Text(shouldWin ? "You should win" : "You should lose")
                .font(.title)
            
            Spacer()
            
            HStack(spacing: 30) {
                ForEach(0..<3) { index in
                    Button {
                        moveTapped(index)
                    } label: {
                        Text(moves[index])
                            .font(.title)
                    }
                    
                }
            }
            Spacer()
        }
        .padding()
        .alert("Game finished!",isPresented: $showAlert) {
            Button("Reset", role: .destructive) { resetGame() }
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    private func moveTapped(_ index: Int) {
        checkChooses(index: index)
        
        round += 1
        if round == totatGame {
            showAlert = true
        } else {
            nextRound()
        }
    }
    
    private func checkChooses(index: Int) {
        if shouldWin {
            // Check if player's move is the winning move
            if moves[index] == winnerMoves[appMove] {
                score += 1
            } else {
                score -= 1
            }
        } else {
            // Check if player's move is the losing move
            if moves[index] == moves[(appMove + 2) % 3] {
                score += 1
            } else {
                score -= 1
            }
        }
    }
    
    private func nextRound() {
        appMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    private func resetGame() {
        score = 0
        round = 0
        nextRound()
    }
}

#Preview {
    ContentView()
}
