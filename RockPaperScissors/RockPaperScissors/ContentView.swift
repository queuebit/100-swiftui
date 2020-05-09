//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Paul Gagnon on 5/8/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let throwOptions = ["✊", "✋", "✌️"]

    @State private var humanShouldWin = Bool.random()
    @State private var robotThrows = Int.random(in: 0 ... 2)
    @State private var humanScore = 0
    @State private var round = 0

    var body: some View {
        VStack {
            Text("Human should \(humanShouldWin ? "WIN" : "LOSE")")
                .padding()
                .font(.headline)
            // Text("Robot threw \(throwOptions[robotThrows])")
            Spacer()
            if (self.round == 10) {
                Button(action: { self.resetGame() }) {
                    Text("Reset Game")
                }
            } else {
                Section(header: Text("Throw:").rotationEffect(.degrees(90))) {
                    ForEach(throwOptions, id: \.self) { (opt: String) -> Button<Text> in
                        Button(action: { self.round(humanThrew: opt) }) {
                            Text(opt)
                        }
                    }
                }
                .rotationEffect(.degrees(-90))
                .font(.largeTitle)
                .padding()
            }
            Spacer()
            HStack {
                Text("ROUND: \(round)")
                    .padding()
                Spacer()
                Text("HUMAN SCORE: \(humanScore)")
                    .padding()
            }
            .font(.footnote)
        }
    }

    func humanWins(humanThrew: String) -> Bool? {
        let robotThrew = throwOptions[robotThrows]
        switch "\(humanThrew)|\(robotThrew)" {
        case "✊|✋":
            return false
        case "✊|✌️":
            return true
        case "✋|✊":
            return true
        case "✋|✌️":
            return false
        case "✌️|✊":
            return false
        case "✌️|✋":
            return true
        default:
            return nil
        }
    }

    func round(humanThrew: String) -> Void {
        let playerWins = self.humanWins(humanThrew: humanThrew)

        switch playerWins {
        case true:
            if humanShouldWin {
                self.humanScore += 1
            } else {
                self.humanScore -= 1
            }
        case false:
            if humanShouldWin {
                self.humanScore -= 1
            } else {
                self.humanScore += 1
            }
        default:
            self.humanScore += 0
        }
        self.round += 1
        self.robotThrows = Int.random(in: 0 ... 2)
        self.humanShouldWin = Bool.random()
    }

    func resetGame() -> Void {
        self.round = 0
        self.robotThrows = Int.random(in: 0 ... 2)
        self.humanScore = 0
        self.humanShouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
