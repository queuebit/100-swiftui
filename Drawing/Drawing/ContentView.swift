//
//  ContentView.swift
//  Drawing
//
//  Created by Paul Gagnon on 6/4/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("moriarty")
                .resizable()
                .scaledToFit()

            Rectangle()
                .fill(Color.blue)
                .blendMode(.multiply)
        }
        .frame(width: 400, height: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
