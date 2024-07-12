//
//  ContentView.swift
//  Navigation
//
//  Created by Okan Orkun on 12.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigateDifferentTypes()
    }
}

struct NavigateDifferentTypes: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
        }
        
    }
}

struct ProgrammaticNavigationWithNavStack: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

struct NavDestinationUsage: View {
    var body: some View {
        NavigationStack {
            List(0 ..< 100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
