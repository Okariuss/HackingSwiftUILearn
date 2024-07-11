//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Okan Orkun on 11.07.2024.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name, type: String
    let amount: Double
}
