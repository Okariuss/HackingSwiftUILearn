//
//  FavoriteView.swift
//  iDine
//
//  Created by Okan Orkun on 8.07.2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favorite: Favorite
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(favorite.items) { item in
                        NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                        }
                    }
                }
            }.listStyle(.grouped)
        }
    }
}

#Preview {
    FavoriteView()
        .environmentObject(Favorite())
        .environmentObject(Order())
}
