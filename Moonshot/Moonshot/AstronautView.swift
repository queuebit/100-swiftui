//
//  AstronautView.swift
//  Moonshot
//
//  Created by Paul Gagnon on 6/1/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text("Missions:")
                    ForEach(self.missions, id: \.id) { mission in
                        Text(mission.displayName)
                    }
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }

    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut

        var crewMemberMissions = [Mission]()

        for mission in missions {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id }) {
                crewMemberMissions.append(mission)
            }
        }

        self.missions = crewMemberMissions
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
