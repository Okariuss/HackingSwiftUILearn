//
//  ContentView.swift
//  iExpense
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.groupedItems) { group in
                    Section(header: Text(group.type)) {
                        ForEach(group.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle(customAmountColor(for: item.amount))
                                    .font(customAmountFont(for: item.amount))
                            }
                        }
                        .onDelete { indexSet in
                            removeItems(at: indexSet, from: group)
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
    
    private func customAmountColor(for amount: Double) -> Color {
        switch amount {
        case ..<10:
            return .green
        case ..<100:
            return .orange
        default:
            return .red
        }
    }
    
    private func customAmountFont(for amount: Double) -> Font {
        switch amount {
        case ..<10:
            return .body
        case ..<100:
            return .headline
        default:
            return .title3.bold()
        }
    }
    
    private func removeItems(at offsets: IndexSet, from group: GroupedExpenseItem) {
        let ids = offsets.map { group.items[$0].id }
        expenses.items.removeAll { ids.contains($0.id) }
    }
}

#Preview {
    ContentView()
}
