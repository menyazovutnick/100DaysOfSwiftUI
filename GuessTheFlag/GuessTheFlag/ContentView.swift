//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nick Khachatryan on 23.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    
    //MARK: - CUSTOM PROPERTIES
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var alertText = ""
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingFinalAlert = false
    
    
    //MARK: - UI
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            print(questionCount)
                            questionCount += 1
                        } label: {
                            Image(countries[number])
                                .flagImageStyle()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("\(alertText) one point, now your score is \(score)")
        }
        .alert("The end!", isPresented: $showingFinalAlert) {
            Button("Reset", action: reset)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            alertText = "Plus"
            score += 1
        } else {
            scoreTitle = "Wrong, That's the flag of \(countries[number])"
            alertText = "Minus"
            score -= 1
        }
        showingScore = true
        
        if questionCount == 8 {
            showingFinalAlert = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        questionCount = 0
        score = 0
        askQuestion()
    }
}


//MARK: - FLAG CUSTOM MODIFIER
struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

extension View {
    func flagImageStyle() -> some View {
        modifier(FlagImage())
    }
}


//MARK: - PREVIEW
#Preview {
    ContentView()
}
