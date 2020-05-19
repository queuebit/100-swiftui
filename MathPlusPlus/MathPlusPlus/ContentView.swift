//
//  ContentView.swift
//  MathPlusPlus
//
//  Created by Paul Gagnon on 5/18/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

var questions: [[Int]] = [[1, 1], [1, 2], [12, 7], [3, 5], [7, 6]]
var answers: [Int] = [1, 2, 84, 15, 42]

struct ContentView: View {
    @State private var answer: String = ""
    @State private var questionNumber = 0
    @State private var questions = 4
    @State private var operation = "*"
    @State private var operands: [Int] = [1, 1]
    @State private var correctAnswer = 1
    @State private var score = 0

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Question \(questionNumber)")) {
                        Text("What is \([String(operands[0]), operation, String(operands[1])].joined(separator: " ")) ?")
                        TextField("The answer is..", text: $answer)
                            .keyboardType(.numberPad)
                    }
                }

                Button("Check") {
                    // do something
                    print(self.answer)
                    print(Int(self.answer) == (self.operands[0] * self.operands[1]))
                }

                HStack {
                    Text("\(questionNumber) of \(questions)")
                    Text("Score: \(score)")
                }
                .padding()
            }
            .onAppear(perform: startGame)
            .navigationBarTitle("Math++")

        }
    }

    func startGame() {
        questionNumber = 1
//        print(type(of: questions[0] ?? [1, 1]))
        correctAnswer = answers[questionNumber]
    }

    func checkAnswer(answer: Int) {
        if (answer == correctAnswer) {
            score += 1
        }

        if (questionNumber == questions) {
            print("Game over; Restarting")
            questionNumber = 0
        } else {
            questionNumber += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
