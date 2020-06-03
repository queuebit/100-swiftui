//
//  Mission.swift
//  Moonshot
//
//  Created by Paul Gagnon on 5/28/20.
//  Copyright © 2020 22q. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String

    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }

    var formattedCrew: String {
        var fCrew = ""
        for crewMember in crew {
            if (fCrew == "") {
                fCrew = crewMember.name
            } else {
                fCrew += ", \(crewMember.name)"
            }
        }
        return fCrew
    }

    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
