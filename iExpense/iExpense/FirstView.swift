//
//  FirstView.swift
//  iExpense
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct FirstView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@okarius")
        }
    }
}

#Preview {
    FirstView()
}
