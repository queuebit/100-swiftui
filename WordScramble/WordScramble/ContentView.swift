//
//  ContentView.swift
//  WordScramble
//
//  Created by Paul Gagnon on 5/12/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(0..<5) {
            Text("Dynamic row \($0)")
        }
    .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
