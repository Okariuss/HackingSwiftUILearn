//
//  RepeatingTimer.swift
//  Flashzilla
//
//  Created by Okan Orkun on 26.07.2024.
//

import SwiftUI

struct RepeatingTimer: View {
    
    let timer = Timer.publish(every: 2, tolerance: 1, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                counter += 1
            }
    }
}

#Preview {
    RepeatingTimer()
}
