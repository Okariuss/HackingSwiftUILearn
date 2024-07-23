//
//  ContentViewViewModel.swift
//  BucketList
//
//  Created by Okan Orkun on 22.07.2024.
//

import Foundation
import MapKit
import CoreLocation
import LocalAuthentication
import SwiftUI

extension ContentView {
    
    @Observable
    final class ViewModel {
        private(set) var locations: [Location]
        var selectedPlace: Location?
        
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        var isUnlocked = false
        var isStandardMap = false
        
        var authError = false
        var authErrorMessage = ""
        
        var biometricError = false
        var biometricErrorMessage = ""
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                fatalError("Unable to save data")
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                    if success {
                        self.isUnlocked = true
                    } else {
                        self.authError = true
                        self.authErrorMessage = "Authentication Error: \(authenticationError?.localizedDescription ?? "Unknown Error")"
                    }
                }
            } else {
                self.biometricError = true
                self.biometricErrorMessage = "Biometric Error: \(error?.localizedDescription ?? "Unknown Error")"
            }
        }
        
        func changeMapStyle() {
            isStandardMap.toggle()
        }
    }
}


