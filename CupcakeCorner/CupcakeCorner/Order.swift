//
//  Order.swift
//  CupcakeCorner
//
//  Created by Okan Orkun on 18.07.2024.
//

import SwiftUI

@Observable
final class Order: Codable {
    static let types = ["Vanillia", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
            saveToUserDefaults()
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = "" {
        didSet { saveToUserDefaults() }
    }
    var streetAddress = "" {
        didSet { saveToUserDefaults() }
    }
    var city = "" {
        didSet { saveToUserDefaults() }
    }
    var zip = "" {
        didSet { saveToUserDefaults() }
    }
    
    enum CodingKeys: String, CodingKey {
        case type, quantity, specialRequestEnabled, extraFrosting, addSprinkles
        case name, streetAddress, city, zip
    }
    
    init() {
        loadFromUserDefaults()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        specialRequestEnabled = try container.decode(Bool.self, forKey: .specialRequestEnabled)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(specialRequestEnabled, forKey: .specialRequestEnabled)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: "savedOrder")
        }
    }
    
    private func loadFromUserDefaults() {
        if let savedOrder = UserDefaults.standard.data(forKey: "savedOrder"),
           let decodedOrder = try? JSONDecoder().decode(Order.self, from: savedOrder) {
            self.type = decodedOrder.type
            self.quantity = decodedOrder.quantity
            self.specialRequestEnabled = decodedOrder.specialRequestEnabled
            self.extraFrosting = decodedOrder.extraFrosting
            self.addSprinkles = decodedOrder.addSprinkles
            self.name = decodedOrder.name
            self.streetAddress = decodedOrder.streetAddress
            self.city = decodedOrder.city
            self.zip = decodedOrder.zip
        }
    }
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        return true
    }
    
    var cost: Decimal {
        
        // $2 per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.5/cake for sprinlles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}
