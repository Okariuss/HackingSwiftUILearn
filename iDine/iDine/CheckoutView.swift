//
//  CheckoutView.swift
//  iDine
//
//  Created by Okan Orkun on 8.07.2024.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoayltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                        
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoayltyDetails.animation())
                
                if addLoayltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: $100") {
                Button("Confirm order") {
                    
                }
            }
            .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
