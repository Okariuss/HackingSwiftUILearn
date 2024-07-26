//
//  Card.swift
//  Flashzilla
//
//  Created by Okan Orkun on 26.07.2024.
//

import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
