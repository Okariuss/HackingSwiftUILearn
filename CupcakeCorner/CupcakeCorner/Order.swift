//
//  Order.swift
//  CupcakeCorner
//
//  Created by Okan Orkun on 18.07.2024.
//

import SwiftUI

@Observable
final class Order {
    static let types = ["Vanillia", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}
