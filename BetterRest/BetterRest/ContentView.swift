//
//  ContentView.swift
//  BetterRest
//
//  Created by Okan Orkun on 9.07.2024.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var sleepTime = calculateBedTime
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Text("When do you want to wake up")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                    ForEach(1..<21) { number in
                        Text("\(number)").tag(number)
                    }
                }
                
                Section("Sleep time:") {
                    Text(calculateBedTime())
                        .font(.largeTitle)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedTime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return DateFormatter.localizedString(from: sleepTime, dateStyle: .none, timeStyle: .short)
        } catch {
            return "Error calculating bedtime"
        }
    }
}

#Preview {
    ContentView()
}
