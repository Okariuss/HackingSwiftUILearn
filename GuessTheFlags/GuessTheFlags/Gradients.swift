//
//  Gradients.swift
//  GuessTheFlags
//
//  Created by Okan Orkun on 8.07.2024.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        ZStack {
            VStack {
                LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
                LinearGradient(stops: [
                    .init(color: .white, location: 0.45),
                    .init(color: .black, location: 0.55),
                ], startPoint: .top, endPoint: .bottom)
                
                RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
                AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
                Text("Your content")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.white)
                    .background(.red.gradient)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Gradients()
}
