//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Okan Orkun on 24.07.2024.
//

import SwiftUI
import SwiftData

struct ProspectsView: View {
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted People"
        case .uncontacted:
            "Uncontacted People"
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter != .none {
            let showContactedOnly = filter == .contacted
            
            _prospects = Query(filter: #Predicate {
                $0.isConnected == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
    
    var body: some View {
        NavigationStack {
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
            }
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospects = Prospect(name: "Paul Hudson", emailAddress: "paul@hackingwithswift.com", isConnected: false)
                        modelContext.insert(prospects)
                    }
                }
        }
        
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
