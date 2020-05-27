//
//  ContentView.swift
//  Moonshot
//
//  Created by Paul Gagnon on 5/26/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
