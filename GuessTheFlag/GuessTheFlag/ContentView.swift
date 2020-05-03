//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Paul Gagnon on 5/3/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let gridSpacing: CGFloat = 70
    let gradientWidth:  CGFloat = 70
    let gradientHeight:  CGFloat = 70

    var body: some View {
        VStack(spacing: gridSpacing / 2) {
            Color.blue.frame(width: 200, height: 200)
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
            Button("Tap me!") {
                print("Button was tapped.")
            }
            Button(action: { print("Edit button was tapped.") }) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil").renderingMode(.original)
                    Text("Edit")
                }
            }
            HStack(spacing: gridSpacing / 2) {
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom).frame(width: gradientWidth, height: gradientHeight)
                RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 5, endRadius: 75).frame(width: gradientWidth, height: gradientHeight)
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center).frame(width: gradientWidth, height: gradientHeight)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
