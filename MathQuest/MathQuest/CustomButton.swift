//
//  CustomButton.swift
//  MathQuest
//
//  Created by Okan Orkun on 10.07.2024.
//

import SwiftUI

struct CustomButton: View {
    
    let title: String
    let action: () -> Void
    let color: Color
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(color)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CustomButton(
        title: "Tap",
        action: {
            
        }, color: .blue
    )
    .previewLayout(.sizeThatFits)
}
