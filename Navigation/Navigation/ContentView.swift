//
//  ContentView.swift
//  Navigation
//
//  Created by Okan Orkun on 12.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        RootViewUsingPathStore()
    }
}

struct RootViewUsingPathStore: View {
    
    @State private var pathStore = PathStoreNormal()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            SecondViewUsingPathStore(number: 0)
                .navigationDestination(for: Int.self) { i in
                    SecondViewUsingPathStore(number: i)
                }
        }
    }
}

struct SecondViewUsingPathStore: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

@Observable
class PathStoreNormal {
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        
        path = []
    }
    
    func save() {
        do {
            let data = try? JSONEncoder().encode(path)
            try data?.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

@Observable
class PathStoreNavigation {
    
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        
        
        
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        do {
            let data = try? JSONEncoder().encode(representation)
            try data?.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct RootView: View {
    
    @State private var path = NavigationPath() // or [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            SecondView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    SecondView(number: i, path: $path)
                }
        }
    }
}

struct SecondView: View {
    var number: Int
    @Binding var path: NavigationPath // or [Int]
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                    //  or
                    //  path.removeAll()
                }
            }
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
