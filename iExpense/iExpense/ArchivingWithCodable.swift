//
//  ArchivingWithCodable.swift
//  iExpense
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct User: Codable {
    let firstName, lastName: String
}

struct ArchivingWithCodable: View {
    
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save user") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ArchivingWithCodable()
}
