//
//  ContentView.swift
//  COVIDCruise
//
//  Created by Paul Gagnon on 5/2/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfPassengers = ""

    let infectionRate = 0.192
    let aPreRate = 0.465
    let icuRate = 0.097
    let deathRate = 0.013
    let passengerToCrewRatio: Double = 2.55
    var numberOfCrew: Int {
        return Int((Double(numberOfPassengers) ?? 0) / passengerToCrewRatio)
    }
    var totalOnBoard: Int {
        return (Int(numberOfPassengers) ?? 0) + numberOfCrew
    }

    var covidPositive: Int {
        return Int(Double(totalOnBoard) * infectionRate)
    }
    var aPreSymptomatic: Int {
        return Int(Double(covidPositive) * aPreRate)
    }
    var icuAdmits: Int {
        return Int(Double(covidPositive) * icuRate)
    }
    var deaths: Int {
        return Int(Double(covidPositive) * deathRate)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Inputs")) {
                    TextField("Number of passengers", text: $numberOfPassengers)
                        .keyboardType(.numberPad)

                    Text("\(numberOfCrew) crew")
                    Text("\(totalOnBoard) total on board")
                    
                }
                
                Section(header: Button(action: {
                    UIApplication.shared.open(URL(string: "https://www.cdc.gov/mmwr/volumes/69/wr/mm6912e3.htm#diamondprincess")!)
                }) { Text("Rates calculated from Diamond Princess: CDC")} ) {
                    Text("Cases: \(covidPositive)")
                    Text("A|Pre-symptomatic: \(aPreSymptomatic)")
                    Text("ICU Admits: \(icuAdmits)")
                    Text("Deaths: \(deaths)")
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
