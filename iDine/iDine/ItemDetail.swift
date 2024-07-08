//
//  ItemDetail.swift
//  iDine
//
//  Created by Okan Orkun on 8.07.2024.
//

import SwiftUI

struct ItemDetail: View {
    
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            Text("Photo: \(item.photoCredit)")
                .padding(4)
                .background(.black)
                .font(.caption)
                .foregroundStyle(.white)
                .offset(x: -5, y: -5)
        }
        Text(item.description)
            .padding()
        
        Button("Order This") {
            order.add(item: item)
        }
        .buttonStyle(BorderedProminentButtonStyle())
        
        Spacer()
            .navigationTitle(item.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        favorite.toggle(item: item)
                    }) {
                        Image(systemName: favorite.isFavorite(item: item) ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                    }
                    .animation(.default, value: favorite.isFavorite(item: item))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: .example)
            .environmentObject(Order())
            .environmentObject(Favorite())
    }
}
