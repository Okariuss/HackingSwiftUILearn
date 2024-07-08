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
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    var body: some View {
        Section {
            Picker("How do you want to pay?", selection: $paymentType) {
                ForEach(paymentTypes, id: \.self) {
                    Text($0)
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
