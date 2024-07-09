//
//  DatePickerView.swift
//  BetterRest
//
//  Created by Okan Orkun on 9.07.2024.
//

import SwiftUI

struct DatePickerView: View {
    
    @State private var wakeUp = Date.now
    
    var body: some View {
        
        DatePicker("Please enter a date", selection: $wakeUp)
        
        DatePicker("Please enter a date", selection: $wakeUp)
            .labelsHidden()
        
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
        
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .date)
        
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
        
    }
}

// MARK: Work with Dates
final class DateView {
    
//    var components = DateComponents()
//    components.hour = 8
//    components.minute = 0
//    
//    let date = Calendar.current.date(from: components) ?? .now

    
//    let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//    let hour = components.hour ?? 0
//    let minute = components.minute ?? 0
    
}

#Preview {
    DatePickerView()
}
