//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Paul Gagnon on 5/3/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let gridSpacing : CGFloat = 70

    var body: some View {
        VStack(spacing: gridSpacing) {
            HStack(spacing: gridSpacing) {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack(spacing: gridSpacing) {
                Text("4")
                Text("5")
                Text("6")
            }
            HStack(spacing: gridSpacing) {
                Text("7")
                Text("8")
                Text("9")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
