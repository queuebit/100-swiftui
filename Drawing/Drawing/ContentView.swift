//
//  ContentView.swift
//  Drawing
//
//  Created by Paul Gagnon on 6/4/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: CGFloat = 0.0

    var body: some View {
        VStack {
            Image("moriarty")
            .resizable()
            .scaledToFit()
            .colorMultiply(.blue)
            .frame(width: 400, height: 400)
            .saturation(Double(amount))
            .blur(radius: (1 - amount) * 20)

            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
