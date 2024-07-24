//
//  AddSwiftPackage.swift
//  HotProspects
//
//  Created by Okan Orkun on 24.07.2024.
//

import SwiftUI
import SamplePackage

struct AddSwiftPackage: View {
    
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    AddSwiftPackage()
}
