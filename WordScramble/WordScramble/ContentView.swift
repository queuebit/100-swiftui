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
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string
                print(fileContents)
            }
        }

        return Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
