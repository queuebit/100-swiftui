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
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
