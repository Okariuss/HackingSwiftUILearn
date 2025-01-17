//
//  Prospect.swift
//  HotProspects
//
//  Created by Okan Orkun on 24.07.2024.
//

import SwiftData
import SwiftUI

@Model
final class Prospect {
    var name: String
    var emailAddress: String
    var isConnected: Bool
    var dateAdded =  Date.now
    
    init(name: String, emailAddress: String, isConnected: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isConnected = isConnected
    }
}
