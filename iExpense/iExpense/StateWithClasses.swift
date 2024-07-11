//
//  StateWithClasses.swift
//  iExpense
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI
import Observation

struct StateWithClasses: View {
    
    @State private var user = UserForClass()
    
    var body: some View {
        
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    StateWithClasses()
}
