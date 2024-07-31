//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Okan Orkun on 30.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    enum SortType: String, CaseIterable {
        case defaultOrder = "Default"
        case alphabetically = "Alphabetically"
        case country = "Country"
    }
    
    @State private var searchText = ""
    @State private var favorites = Favorites()
    @State private var selectedSortType: SortType = .defaultOrder
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var sortedResorts: [Resort] {
        let sorted: [Resort]
        switch selectedSortType {
        case .defaultOrder:
            sorted = resorts
        case .alphabetically:
            sorted = resorts.sorted { $0.name < $1.name }
        case .country:
            sorted = resorts.sorted { $0.country < $1.country }
        }
        
        if searchText.isEmpty {
            return sorted
        } else {
            return sorted.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            Picker("Sort by", selection: $selectedSortType) {
                ForEach(SortType.allCases, id: \.self) { sortType in
                    Text(sortType.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            List(sortedResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                    }
                    if favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
