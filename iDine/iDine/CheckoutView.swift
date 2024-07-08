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
    @State private var showingPaymentAlert = false
    @State private var pickupTime = "Now"
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    let pickupTimes = ["Now","Tonight","Tomorrow Morning"]
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
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
            
            Section("When you want to pickup?") {
                Picker("Pickup Time", selection: $pickupTime) {
                    ForEach(pickupTimes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.automatic)
            }
            
            Section("Add a tip?") {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
            .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        }
        .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
            
        } message: {
            Text("Your total was \(totalPrice) - Thank you!")
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
