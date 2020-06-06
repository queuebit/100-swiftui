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
        Capsule()
        .strokeBorder(ImagePaint(image: Image("moriarty"), scale: 0.1), lineWidth: 20)
        .frame(width: 300, height: 200)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
