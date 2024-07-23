//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Okan Orkun on 23.07.2024.
//

import Foundation

extension EditView {
    
    @Observable
    final class ViewModel {
        enum LoadingState {
            case loading, loaded, failed
        }
        
        var location: Location
        var loadingState = LoadingState.loading
        
        var name: String
        var description: String
        
        private(set) var pages: [Page] = []
        
        
        init(location: Location) {
            self.location = location
            self.name = location.name
            self.description = location.description
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                fatalError("Bad URL: \(urlString)")
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let items = try JSONDecoder().decode(Result.self, from: data)
                
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
        }
        
        func save() -> Location {
            var newLocation = location
            newLocation.id = UUID()
            newLocation.name = name
            newLocation.description = description
            
            return newLocation
        }
    }
}
