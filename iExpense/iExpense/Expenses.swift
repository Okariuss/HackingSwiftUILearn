//
//  Expenses.swift
//  iExpense
//
//  Created by Okan Orkun on 11.07.2024.
//

import Foundation

@Observable
final class Expenses {
    
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var groupedItems: [GroupedExpenseItem] {
        let personalItems = items.filter { $0.type == "Personal" }
        let businessItems = items.filter { $0.type == "Business" }

        return [
            GroupedExpenseItem(type: "Personal", items: personalItems),
            GroupedExpenseItem(type: "Business", items: businessItems)
        ].filter { !$0.items.isEmpty }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
