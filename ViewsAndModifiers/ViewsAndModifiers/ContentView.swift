//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Paul Gagnon on 5/6/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
        .padding()
            .background(Color.red)
        .padding()
            .background(Color.blue)
        .padding()
            .background(Color.green)
        .padding()
            .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
