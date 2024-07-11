//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Okan Orkun on 11.07.2024.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name, type: String
    let amount: Double
}

struct GroupedExpenseItem: Identifiable, Codable {
    var id = UUID()
    let type: String
    let items: [ExpenseItem]
}
