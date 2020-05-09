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
            ForEach(throwOptions, id: \.self) {
                Text($0)
            }
            Text("ROUND: \(round)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
