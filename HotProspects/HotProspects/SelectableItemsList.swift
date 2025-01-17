//
//  SelectableItemsList.swift
//  HotProspects
//
//  Created by Okan Orkun on 24.07.2024.
//

import SwiftUI

struct SelectableItemsList: View {
    @State private var selection = Set<String>()
    
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    var body: some View {
        
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if selection.isEmpty == false {
            Text("You selected \(selection.formatted())")
        }
        
        EditButton()
    }
}

#Preview {
    SelectableItemsList()
}
