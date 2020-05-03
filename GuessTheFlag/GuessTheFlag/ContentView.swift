//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Paul Gagnon on 5/3/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello, World!")
            Text("This is inside a stack")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
