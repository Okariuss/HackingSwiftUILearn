//
//  CardView.swift
//  Flashzilla
//
//  Created by Okan Orkun on 26.07.2024.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    @State private var isShowingAnswer = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
                
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 250)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

#Preview {
    CardView(card: .example)
}
