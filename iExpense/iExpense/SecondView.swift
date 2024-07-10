//
//  SecondView.swift
//  iExpense
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct SecondView: View {
    
    let name: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Hello, \(name)")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    SecondView(name: "Okan")
}
