//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Paul Gagnon on 5/6/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
        .font(.largeTitle)
        .padding()
        .background(Color.blue)
        .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
                .foregroundColor(.red)
        }
        .foregroundColor(.white)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
