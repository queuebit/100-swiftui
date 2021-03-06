//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Paul Gagnon on 5/21/20.
//  Copyright © 2020 22q. All rights reserved.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
    var styledColor: Color {
        switch amount {
        case 0..<10:
            return Color.gray
        case 10..<100:
            return Color.black
        default:
            return Color.red
        }
    }
}

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}
