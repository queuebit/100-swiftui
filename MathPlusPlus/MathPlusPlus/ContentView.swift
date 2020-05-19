//
//  ContentView.swift
//  MathPlusPlus
//
//  Created by Paul Gagnon on 5/18/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var questionNumber = 1
    @State private var questions = 4
    @State private var operation = "*"
    @State private var operands = [12, 7]
    @State private var correctAnswer = 84
    @State private var answer: String = ""

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

                Text("\(questionNumber) of \(questions)")
                .padding()
            }
            .navigationBarTitle("Math++")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
