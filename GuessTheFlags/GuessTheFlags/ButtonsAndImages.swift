//
//  ButtonsAndImages.swift
//  GuessTheFlags
//
//  Created by Okan Orkun on 8.07.2024.
//

import SwiftUI

struct ButtonsAndImages: View {
    var body: some View {
        Form {
            
            Section("Button type 1") {
                Button("Delete selection", action: executeDelete)
                Button("Delete selection", role: .destructive, action: executeDelete)
            }
            
            Section("Button type 2") {
                VStack {
                    Button("Button 1") { }
                        .buttonStyle(.bordered)
                    Button("Button 2", role: .destructive) { }
                        .buttonStyle(.bordered)
                    Button("Button 3") { }
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                    Button("Button 4", role: .destructive) { }
                        .buttonStyle(.borderedProminent)
                }
            }
            
            Section("Button type 3") {
                Button {
                    print("Button was tapped")
                } label: {
                    Text("Tap me!")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }
            }
            
            Section("Button with Image type 1") {
                Button {
                    print("Edit button was tapped")
                } label: {
                    Image(systemName: "pencil")
                }
                
                Button("Edit", systemImage: "pencil") {
                    print("Edit button was tapped")
                }
                
                Button {
                    print("Edit button was tapped")
                } label: {
                    Label("Edit", systemImage: "pencil")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting…")
    }
}

#Preview {
    ButtonsAndImages()
}
