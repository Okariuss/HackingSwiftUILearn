//
//  User.swift
//  SwiftDataProject
//
//  Created by Okan Orkun on 20.07.2024.
//

import Foundation
import SwiftData

@Model
final class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
