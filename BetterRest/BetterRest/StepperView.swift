//
//  Stepper.swift
//  BetterRest
//
//  Created by Okan Orkun on 9.07.2024.
//

import SwiftUI

struct StepperView: View {
    
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    StepperView()
}
