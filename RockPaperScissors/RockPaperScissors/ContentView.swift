//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Paul Gagnon on 5/8/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let throwOptions = ["Rock", "Paper", "Scissors"]

    @State private var humanShouldWin = Bool.random()
    @State private var robotThrows = Int.random(in: 0 ... 2)
    @State private var playerScore = 0
    @State private var round = 0

    var body: some View {
        VStack {
            Text("Human should \(humanShouldWin ? "WIN" : "LOSE")")
            Text("Robot threw \(throwOptions[robotThrows])")
            Text("Choose your move:")
            ForEach(throwOptions, id: \.self) { (opt: String) -> Button<Text> in
                Button(action: { print(self.playerWins(playerThrew: opt) ?? "PUSH") }) {
                    Text(opt)
                }
            }
            Text("ROUND: \(round)")
        }
    }

    func playerWins(playerThrew: String) -> Bool? {
        let robotThrew = throwOptions[robotThrows]
        switch "\(playerThrew)|\(robotThrew)" {
        case "Rock|Paper":
            return false
        case "Rock|Scissors":
            return true
        case "Paper|Rock":
            return true
        case "Paper|Scissors":
            return false
        case "Scissors|Rock":
            return false
        case "Scissors|Paper":
            return true
        default:
            return nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
