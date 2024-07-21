//
//  ComparableLearn.swift
//  BucketList
//
//  Created by Okan Orkun on 21.07.2024.
//

import SwiftUI

struct ComparableUser: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func < (lhs: ComparableUser, rhs: ComparableUser) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ComparableLearn: View {
    
    let users = [
        ComparableUser(firstName: "Arnold", lastName: "Rimmer"),
        ComparableUser(firstName: "Kristine", lastName: "Kochanski"),
        ComparableUser(firstName: "David", lastName: "Lister")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

#Preview {
    ComparableLearn()
}
