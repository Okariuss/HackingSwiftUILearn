//
//  UserDefaultsUsage.swift
//  iExpense
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct UserDefaultsUsage: View {
    
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("Tap") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    UserDefaultsUsage()
}
