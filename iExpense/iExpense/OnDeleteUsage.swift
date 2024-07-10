//
//  OnDeleteUsage.swift
//  iExpense
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct OnDeleteUsage: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: { indexSet in
                        numbers.remove(atOffsets: indexSet)
                    })
                }
                
                Button("Add number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    OnDeleteUsage()
}
