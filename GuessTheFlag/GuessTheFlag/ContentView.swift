//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Paul Gagnon on 5/3/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    var strokeColor: Color
    var animate: Bool
    var correct: Bool

    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule()
                .stroke(strokeColor, lineWidth: 2))
            .shadow(color: .black, radius: 4)
            .rotationEffect(animate && correct ? .degrees(360) : .degrees(0))
            .animation(.easeIn)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var scoreOutOf = 0

    func strokeColor (_ answer: Int) -> Color {
        if (showingScore && answer == correctAnswer) {
            return Color.yellow
        }
        return Color.black
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)

                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(country: self.countries[number], strokeColor: self.strokeColor(number),
                                  animate: self.showingScore,
                                  correct: number == self.correctAnswer)
                    }
                }
                if scoreOutOf > 0 {
                    Text("Score: \((Double(score) / Double(scoreOutOf) * 100.0), specifier: "%.0f")%")
                        .foregroundColor(.white)
                        .font(.headline)
                }

                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score) / \(scoreOutOf)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong; that was the flag of \(self.countries[number])."
        }

        scoreOutOf += 1
        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
