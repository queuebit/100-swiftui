//
//  ContentView.swift
//  Moonshot
//
//  Created by Paul Gagnon on 5/26/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        // However, there’s an important catch that you need to be aware of: when we add views to a scroll view they get created immediately.
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
