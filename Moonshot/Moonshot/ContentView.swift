//
//  ContentView.swift
//  Moonshot
//
//  Created by Paul Gagnon on 5/26/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showLaunchDate = true


    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, missions: self.missions, astronauts: self.astronauts)) {
                    Image(mission.image)
                    .resizable()
                        // .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if (self.showLaunchDate) {
                            Text(mission.formattedLaunchDate)
                        } else {
                            Text(mission.formattedCrew)
                        }
                    }
                }
            }
        .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button(showLaunchDate ? "Show Crew" : "Show Launch") {
                self.showLaunchDate.toggle()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
