//
//  CodableObservableClassLearn.swift
//  CupcakeCorner
//
//  Created by Okan Orkun on 18.07.2024.
//

import SwiftUI


@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Taylor"
}

struct CodableObservableClassLearn: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    CodableObservableClassLearn()
}
