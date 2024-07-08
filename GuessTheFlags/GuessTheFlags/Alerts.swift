//
//  Alerts.swift
//  GuessTheFlags
//
//  Created by Okan Orkun on 8.07.2024.
//

import SwiftUI

struct Alerts: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        Form {
            Section("Alert type 1") {
                Button("Show Alert") {
                    showingAlert = true
                }
                .alert("Important message", isPresented: $showingAlert) {
                    Button("Delete", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                }
            }
            
            Section("alert type 2") {
                Button("Show Alert 2") {
                    showingAlert = true
                }.alert("Important Message", isPresented: $showingAlert) {
                    
                } message: {
                    Text("Please read this")
                }
            }
        }
    }
}

#Preview {
    Alerts()
}
