//
//  ContentView.swift
//  COVIDCruise
//
//  Created by Paul Gagnon on 5/2/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Input")
                    
                }
                
                Section {
                    Text("Output")
                }
            }
        .navigationBarTitle("COVID-19 Cruise")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
