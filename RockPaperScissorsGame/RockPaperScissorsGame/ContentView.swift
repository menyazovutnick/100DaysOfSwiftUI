//
//  ContentView.swift
//  RockPaperScissorsGame
//
//  Created by Nick Khachatryan on 24.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["✊", "✋", "✌️"]
    
    @State private var appChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingResults = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("App has chosen")
            
            Text(moves[appChoice])
                .font(.system(size: 200))
            
            Text("You should")
            
            if shouldWin {
                Text("WIN")
                    .foregroundStyle(.green)
                    .font(.title)
            } else {
                Text("LOSE")
                    .foregroundStyle(.red)
                    .font(.title)
            }
            
            HStack {
                ForEach(0..<3) { number in
                    Button(moves[number]) {
                        play(choice: number)
                    }
                    .font(.system(size: 100))
                }
            }
            
            Spacer()
            
            Text("Score: \(score)")
                .font(.subheadline)
            
            Spacer()
        }
        .alert("Game over", isPresented: $showingResults) {
            Button("Play again", action: reset)
        } message: {
            Text("Your score was \(score)")
        }
    }
    
    func play(choice: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningMoves[appChoice]
        } else {
            didWin = winningMoves[choice] == appChoice
        }
        
        if didWin {
            score += 1
        } else {
            score -= 1
        }
        
        if questionCount == 10 {
            showingResults = true
        } else {
            appChoice = Int.random(in: 0..<3)
            shouldWin = Bool.random()
            questionCount += 1
        }
    }
    
    func reset() {
        appChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        questionCount = 0
        score = 0
    }
    
}

#Preview {
    ContentView()
}
